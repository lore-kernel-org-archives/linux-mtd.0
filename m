Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FlTpA-00075n-Q8
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 12:45:44 -0400
Message-ID: <447DC80E.6040604@yandex.ru>
Date: Wed, 31 May 2006 20:45:02 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
	<1149062982.32620.67.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>
	<1149086997.32620.101.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605311105170.16927@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0605311105170.16927@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
>>>Don't be ridiculous.  There is no way you can find 20 capabilities total 
>>>for a generic MTD interface.
>>I'm not sure it can't be the case.
> 
> Last time we enumerated less than 10 parameters that would cover more 
> than 90% of all cases in a clean and obvious way.  One is 
> mtd->block_write_size.  For most NOR flash this is 1.  For Sibley this 
> is 1024.  For ECC NOR I think it is 16.  For NAND it is another value. 
> Etc.  Why should that value be determined _each_ time at runtime based 
> on mtd->type using your macro proposal while it can be directly obtained 
> from mtd->block_write_size?
Why are you talking about mtd->block_write_size? Its completely 
irrelevant and has nothing to do with flags. I've never said we don't 
need it. I've always said we *do* need it instead of mtd->oobblock stuff 
many times and since long time ago.

> This also means that JFFS2 can use:
> 
> 	if (mtd->block_write_size > 1)
> 		use_wbuf();
Sure.

> while your proposal would require the equivalent of:
> 
> 	if (mtd->type == SIBLEY || mtd->type == NAND ||
> 	    mtd->type == DATAFLASH || mtd->type == ECC_NOR || ... )
> 		use_wbuf();
That's not my proposal.

> And yet wbuf() still doesn't know how big the buffer should be. Don't 
> you see the difference?
I see the difference and have always seen it.

> And if a driver for another type of flash is added to the kernel then it 
> only needs to initialise its own value for mtd->block_write_size and 
> JFFS2 will just work with no change.
Of course, but how does this relate to mtd->flags?

> Whereas with your own view the fact that mtd->type is set to GOAT_FLASH 
> then you need to modyfy _all_ users of the MTD interface so they learn 
> to also consider mtd->type == GOAT_FLASH and to hardcode its buffer size 
> which might well be yet another value like 8192.
No. Writesize is another question. I talked about capabilities like:

* can individual bits be cleared or not?
* do we have to erase eraseblocks before writing to them (dataflash may 
erase before writing itself)
* does this MTD device guarantee erase operation atomicity or not? I.e., 
does JFFS2 have to maintain cleanmarkers or they are not needed.
* does this flash has the "radiation" feature like AG-AND does.
* does this flash may take advantage of parallel operations or not? 
E.g., there may be a striping layer below, or this may be a HW array of 
flash chips which may operate in parallel.

etc etc etc.

The number of features and capabilities like this may be very large.

> Isn't that obvious enough that the mtd->type method is suboptimal and 
> obfuscates the code?  What do you not get at this point?
And it's obvious, that you can't foresee all the features. It is obvious 
that new applications may want new features you can't even imagine now.

>>OK, I agree with you. It is a function of the hardware. But, the
>>mtd->flags field anyway becomes application dependent, just because the
>>number of hardware features is very large, and you introduce only those
>>flags *applications* need.
> 
> So?  What's the problem?
"Problem" is a too loud word here. I just pointed that a new feature may 
require changing many drivers, and this is a drawback of Joern's 
approach. Nothing else.

>>Example. Let's consider the AG-AND flash. Some of them have a property
>>when you erase some eraseblocks, but the neighboring eraseblocks get
>>slowly corrupted. Is this a flash feature? - Yes. Do you have a flag for
>>it? - No.
> 
> Why not?
That was just an example that we cannot foresee all the capabilities. 
And "no" is because I think it is bad to change *MTD core* when a *user* 
needs a new feature flag. Just bad.

>>So, the idea is that number of features is potentially high. And there
>>is a dependency on the application present in a way.
> 
> If you need to support completely fubar flash then of course the 
> capability model may not cover them adequately and you might have to 
> bastardize the application code based on
> 
> 	if (mtd->type == FUBAR_FLASH)
> 		do_this_fubar_hack();
> 
> But this is maybe 10% of the cases.  The other 90% will fit in the 
> generic model just fine.
Well. My idea is that in this case you open the mtd_capabilities.h file, 
and add a

#define mtd_is_my_new_feature(mtd) (blah)

Or if it is completely not of other's interest, you do like you pointed.

>>I also have to check if other flashes have these capabilities, and add
>>it to them if yes. So I have to change drivers.
> 
> You don't _have_ to.  Again, if the code worked fine without knowledge 
> of a given capability before then the addition of support for a given 
> capability won't break those who don't advertise that capability.
It won't break. But you should agree that if a add a new capability, I 
have to check all flashes, not just the one I'm interested in.

> But if we consider your own view, the addition of a new MTD _user_ 
> require that the author of that new module knows about all flash types 
> currently provided by MTD and cope with each of their specific 
> characteristics which should be deduced from mtd->type.  If instead it 
> only needs to cope with mtd->block_write_size to use that same example 
> again then things are much simpler for both user module authors and 
> flash driver authors.
Writesize is another. We have a "flash model" and it is exposed by 
mtd_info. Writesize is *the part of this model*, OK? There were many 
mails where we talked about this generic flash model".

All the peculiarities are hidden. So, we are basically talking about 
*how to still let users know about some peculiarities*. For example, for 
optimization.

Joern's approach is to gave mtd->flags stuff.
My approach is to base this all on mtd->type.

>>Isn't it bad to have mtd->flags1, mtd->flags2, etc?
> 
> Why not?  In fact it can be made into a structure bit field that the C 
> language already supports rather well.
> 
> 	struct MTD_blah {
> 		...
> 		int can_do_x : 1;
> 		int can_DO_Y : 1;
> 		INT CAN_DO_Z : 1;
> 		...
> 	}
Hmm, this is good idea, but I still think we must not put stuff like 
this to mtd_info. It is out of our "common flash model". The model is 
fixed and firm. "Fluent" stuff like this should be out of it, above it.

>>>>So, this is not an extensible solution.
>>>Artem you're more brilliant than that.
>>Frankly, I can't get the meaning of this :-(
> I'm sorry for you then.
Impolite.

>>I was telling about a general approach, you're telling about technical
>>details. Well, if you care about code size and speed, then create
>>mtd_capabilities.c, call add an init_capabilities() call which is called
>>on initialization, and have variables for each feature.
> 
> I care about a general approach that [surprise surprise] also allows for 
> obvious code from a readability point of view and produce small and fast 
> runtime code.
I don't see any difference in readability. In both cases you have

if (can_milk_a_goat())
	milk();

>>The Idea still stays unchanged - it's a thin layer over mtd->type.
>>Implement it differently.
> 
> I'm glad you say yourself that it is an extra (IMHO unneeded) layer over 
> mtd->type.
Although it is a layer, it makes no additional overhead. But it makes 
MTD completely independent on features people may think of.

> It is an extra layer over mtd->type.  That's the drawback.
It's a plus: better layering, no overhead, more independence to MTD core.

>>I care more
>>about the MTD_GENERIC_TYPE stuff, which is senseless in my opinion.
> 
> And I agreed with you on that point already.  Did you miss it?
No. I didn't. I just wanted to say that I wrote "why" previously, so I 
don't write it now.

>>I wrote about this, and don't see any reaction.
> 
> Do you ignore everything I wrote not addressed to you directly?
No, that was addressed more to Joern, I meant "I don't see any reaction 
from Joern", because I wrote about that to him.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
