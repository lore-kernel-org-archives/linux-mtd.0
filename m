From: arne.jonsson@i3micro.com (Arne Jonsson)
Date: Mon, 24 Feb 2003 08:08:22 +0100
Subject: JFFS2 for 2.0 kernel?
References: <3E59BACB.762BB6C7@i3micro.com> <1046069750.1867.1.camel@imladris.demon.co.uk>
Message-ID: <3E59C4E6.BFF740B9@i3micro.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

David Woodhouse wrote:

> It would be quite a lot of work; the file system layer in Linux changed
> dramatically between the 2.0 and 2.2 kernels. You'd have a better chance
> of porting to 2.2 -- in fact I think someone's already done so.
I was afraid of that, but we need the 2.0 kernel (at least for now).
 
> Why do you want 2.0?
We are using using JFFS with MTD and the uClinux 2.0.38 kernel. I have
some concerns re. JFFS and powercycling and as I understand the JFFS2 is
more robust. Another option would be to make JFFS more robust but I
assume that that might be an even bigger challenge.

Best regards,
/Arne Jonsson
-- 
Arne Jonsson
i3 micro technology AB
Phone:+46-8-506 388 00
Fax:  +46-8-506 388 75
