Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LLMi-0000w1-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 11:10:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020621095028.20837.qmail@linuxmail.org> 
References: <20020621095028.20837.qmail@linuxmail.org> 
To: "xyz xyz" <watsup@linuxmail.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: X11 or microwindows on a DOC using GRUB?? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Jun 2002 11:09:39 +0100
Message-ID: <6989.1024654179@redhat.com>
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

watsup@linuxmail.org said:
>  now we need to develop some configurator modules and an user
> interface on our X client,so the problem is shall i go ahead with
> development for X11 or microwindows?

> the dilemma is bcoz of the fact that X11 client is providing a better
> resolution as compared to microwindows,but i feel for an embedded
> device microwindows is the rite choice,(as far as size is concerned
> ,with microwindows we are savin lot of space but anyway we r not using
> that space,it will b free) 

The TinyX server used on the iPAQ is only about 700KiB. That's not really 
so huge, although it's still larger than microwindows.

You might also consider using Qt-Embedded. 

--
dwmw2
