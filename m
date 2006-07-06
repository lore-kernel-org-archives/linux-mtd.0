Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FyVrO-0007KN-FK
	for linux-mtd@lists.infradead.org; Thu, 06 Jul 2006 11:34:11 -0400
Date: Thu, 6 Jul 2006 18:33:39 +0300
From: Ville Herva <vherva@vianova.fi>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work
Message-ID: <20060706153339.GP15078@vianova.fi>
References: <20060706082443.GL15078@vianova.fi>
	<20060706141356.GA30171@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060706141356.GA30171@wohnheim.fh-wedel.de>
Reply-To: vherva@vianova.fi, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 06, 2006 at 04:13:57PM +0200, you [Jörn Engel] wrote:
> 
> Looks fairly good as a basis.  A couple of details still remain...

Great.
 
> > -	char buf[80+12]; /* 80 for device, 12 for erase size */
> > +	char* val = (char*)block2mtd_paramline;
> 
> The * usually belongs to the var, not the type.  

Ok, I to follow the kernel style, but missed that. You're right.

> Also, I believe we
> don't need the cast here.
> 	char *val = block2mtd_paramline;

Fair enough.

> > +	char buf[80 + 12], *str = buf; /* 80 for device, 12 for erase size */
> >  	char *str = buf;
> 
> Now we have two variables called "str".

Oops, I'm terribly sorry. There were minor changes between 2.6.17.3 and MTD
GIT. I decided to rediff againt MTD GIT, but apparently wasn't careful
enough, since I introduced that merging error.
 
> Maybe the variable declaration can stay at the top of the function,
> just to reduce the amount of churn.

Fair enough.

> > +static int block2mtd_setup(const char *val, struct kernel_param *kp)
> > +{
> > +	/* Only save the parameters here. We must parse them later:
> > +	   if the param passed from kernel boot command line,
> > +	   block2mtd_setup() is called so early that it is not
> > +	   possible to resolve the device (even kmalloc() fails).
> > +	   Deter that work to block2mtd_setup2(). */
> > +
> > +	strlcpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
> > +
> > +	/* If more parameters are later passed in via
> > +	   /sys/module/block2mtd/parameters/block2mtd
> > +	   and block2mtd_init() has already been called,
> > +	   we can parse the argument now. */
> > +
> > +	if (block2mtd_init_called)
> > +		return block2mtd_setup2();
> 
> Took me a couple of minutes to understand what you're doing here.
> Makes sense. 

Well that's not the only way to do it, and arguably not the cleanest way,
but it worked for me.

> But passing the parameter to block2mtd_setup2() through
> a global variable instead of stack allows races when two people add
> device through the /sys/... file.  We could add spinlocks around this
> function and block2mtd_init() to solve that.  Or we could decide it's
> not worth the effort.

You're right, I didn't think of that. (I'm a complete kernel newbie, sorry.)

Perhaps we could do:

static int block2mtd_setup(const char *val, struct kernel_param *kp)
{
	if (block2mtd_init_called)
		return block2mtd_setup2(val);

	strlcpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));

instead of 

static int block2mtd_setup(const char *val, struct kernel_param *kp)
{
	strlcpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));

	if (block2mtd_init_called)
		return block2mtd_setup2();

and then parse val in block2mtd_setup2() instead of block2mtd_paramline if
it is not non-NULL. Avoids the strlcpy(). I'm not sure that's better than
spinlocks. I'm not also sure there aren't problems in adding devices in
parallel later in the code path (perhaps you looked closer.) And what I feel
least the least qualified to comment is if this worth it at all (I'll leave
that to you) :).

Another thing I thought a bit about is that the global block2mtd_paramline
array is now never released. It's only 92 bytes, but still.

If I'm reading http://www.faqs.org/docs/kernel_2_4/lki-1.html 1.8 "Freeing
initialisation data and code" right, block2mtd_paramline could be marked as
__initdata, right? It should be freed after module_init(). In module case,
it is still compiled in, and not released until the module is unloaded -
that of course could be #ifdef'ed, but perhaps the code clutter is not worth
it?

> If you can address the first two comments, I'm happy.

Sure, I'll redo the patch with those addressed and resend. 

I can look at the other two points later, depending on your comments.


-- v -- 

v@iki.fi
