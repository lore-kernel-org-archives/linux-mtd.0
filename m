Received: from 205-158-62-105.outblaze.com ([205.158.62.105] helo=ws4-4.us4.outblaze.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LLXJ-0000x2-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 11:21:02 +0100
Message-ID: <20020621102030.9607.qmail@linuxmail.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "xyz xyz" <watsup@linuxmail.org>
To: <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Date: Fri, 21 Jun 2002 18:20:30 +0800
Subject: Re: X11 or microwindows on a DOC using GRUB??
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

well,i know abt the present options for running X on an embedded device,the question is which one to use?
the stripped down X11 or microwindows?
(space is not posing much problem since we have space for both)

hows the practical performance of microwindows?
i saw some black patches when using microwindows and screen needs to b refreshed manually?is it a common prob in microwindows ?(i know we r going away from the 
purpose of this mailing list but plz advise)
----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 21 Jun 2002 11:09:39 +0100
To: "xyz xyz" <watsup@linuxmail.org>
Subject: Re: X11 or microwindows on a DOC using GRUB?? 


> 
> watsup@linuxmail.org said:
> >  now we need to develop some configurator modules and an user
> > interface on our X client,so the problem is shall i go ahead with
> > development for X11 or microwindows?
> 
> > the dilemma is bcoz of the fact that X11 client is providing a better
> > resolution as compared to microwindows,but i feel for an embedded
> > device microwindows is the rite choice,(as far as size is concerned
> > ,with microwindows we are savin lot of space but anyway we r not using
> > that space,it will b free) 
> 
> The TinyX server used on the iPAQ is only about 700KiB. That's not really 
> so huge, although it's still larger than microwindows.
> 
> You might also consider using Qt-Embedded. 
> 
> --
> dwmw2
> 
> 
> 

-- 
Get your free email from www.linuxmail.org 


Powered by Outblaze
