Received: from ns1.spewey.com ([64.170.22.140])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D5Cf-0006Jo-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 15:13:01 +0100
Message-Id: <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com>
Date: Thu, 21 Jun 2001 09:29:06 -0500
To: Abraham vd Merwe <abraham@2d3d.co.za>
From: Vipin Malik <mtd-linux@embeddedlinuxworks.com>
Subject: Re: safe flash filesystem
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
In-Reply-To: <20010621155737.A26310@crystal.2d3d.co.za>
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com>
 <20010621125458.A23785@crystal.2d3d.co.za>
 <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>Exciting stuff. It does address the issues I'm interested in. More
>specifically I agree that a driver level system is needed and not a user
>layer (otherwise we should be using Sleepycat's db3 which is perfect for
>transactional data except that it's not free).

Yeah, that "except is not free" means it costs >100K USD (for the 
transaction version) if I remember the quote they gave me.

Plus, it's too "thick" for the typical use in embedded systems to store 
configuration variables and a few logs and data values.

>Doing this sort of thing properly though is a huge task however and should
>be carefully planned.
>
>I'm really interested in helping (if we're talking driver, not user level
>process - I don't want to develop a database :P)

I guess I should change the name away from a "database", as I really don't 
want to do anything more drastic than maybe a linear "recno" type flat file 
database or something very simple. Something that you or I may have 
probably implemented anyway to solve our needs to store these config 
variables in our respective systems.

I did not have a full featured commercial "database" type database in mind, 
or even anything close.

I agree that this functionality should be present in the JFFS2 layer 
itself, but have been unable to convince the powers to be.

David W. says that he'll entertain a diff -u if we (I) implement the 
feature, but I don't think that I have the time or the capability to change 
JFFS2 to implement this functionality all by myself. Plus the issue of the 
blocked access will remain (even if we solve the power fail issue) and the 
solution to that may be not be acceptable for inclusion to the regular 
JFFS2 fs.

Maybe you may want to subscribe to the development list on the 
www.EmbeddedLinuxWorks site and we can take this discussion there. I am 
looking for user input to define the feature set of this "config system" 
(not database :) And I want to make it LGPL (if it does become a lib or 
task) so that users can link to it without releasing the source of their 
own code.

I can't believe that you and I are the only folks that may be interested in 
this. Maybe there is an existing solution- we just don't know about it- or 
other's have not thought about this issue just yet ;)

Regards,

Vipin
