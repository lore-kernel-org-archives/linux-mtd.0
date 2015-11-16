Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyQgQ-0001DB-9f
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 20:47:26 +0000
Received: by pacej9 with SMTP id ej9so79230775pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 12:47:05 -0800 (PST)
Date: Mon, 16 Nov 2015 12:47:02 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-mtd@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: spi: OF module autoloading is still broken
Message-ID: <20151116204702.GP8456@google.com>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com>
 <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com>
 <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com>
 <564A101F.9090807@osg.samsung.com>
 <20151116192434.GO8456@google.com>
 <564A35EB.5080008@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564A35EB.5080008@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Nov 16, 2015 at 05:00:43PM -0300, Javier Martinez Canillas wrote:
> On 11/16/2015 04:24 PM, Brian Norris wrote:

> I also didn't think about wilcards... I wonder why there are trailing
> wildcards for a compatible string. After all a compatible string should
> define a particular IP and there could be a foo,bar and foo,barbaz that
> have different drivers and what prevents today the driver with alias
> of:N*T*Cfoo,bar* to be loaded due a MODALIAS=of:NfooT<NULL>Cfoo,barbar ?
> 
> So I think we need this regardless of my patch:
> 
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 5b96206e9aab..cd0002f4a199 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -704,7 +704,6 @@ static int do_of_entry (const char *filename, void *symval, char *alias)
>  		if (isspace (*tmp))
>  			*tmp = '_';
>  
> -	add_wildcard(alias);
>  	return 1;
>  }
>  ADD_TO_DEVTABLE("of", of_device_id, do_of_entry);

(I'm also not an expert in this stuff, but...) That looks reasonable.
You might refer to commit ac551828993e ("modpost: i2c aliases need no
trailing wildcard") for inspiration. You might also modify the "always"
in:

/* Always end in a wildcard, for future extension */
static inline void add_wildcard(char *str)
{
	...
}

And of course, you probably should CC those who are responsible for the
core device tree probing and device/driver interactions for something
like this.

> Now that I think about it, there is another issue and is that today spi:foo
> defines a namespace while changing to of: will make the namespace flat so
> a platform driver that has the same vendor and model will have the same
> modalias.
> 
> IOW, for board files will be platform:bar and i2c:bar while for OF will be
> of:NfooT<NULL>Cfoo,bar in both cases. I wonder if we should reuse the type
> for that and store the subsystem prefix there. What do you think?

I'm not sure I understand all the issues here to be able to comment
properly. But I bet someone else might.

(For me, it might help if you had a more concrete example to speak of.)

> Thanks a lot for pointing out all these issues. It is indeed harder than
> I thought.

No problem!

> > I don't think you have problems only with bad FDTs. I think you have a
> > problem with perfectly valid DTs.
> >
> 
> Agreed, I wonder if spi_uevent() shouldn't be changed to report both the
> OF and old SPI modaliases to avoid breaking a lot of drivers but at the
> same time allowing DT-only drivers to not need an SPI ID table.

That's the solution I imagined, though I haven't tested it yet. I don't
see much precedent for reporting multiple modaliases, so there could be
some kind of ABI issues around that too.

Regards,
Brian
