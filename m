Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KL5q-0004pq-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 16:40:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020618112117.5634.qmail@linuxmail.org> 
References: <20020618112117.5634.qmail@linuxmail.org> 
To: "xyz xyz" <watsup@linuxmail.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC boot prob,making rum 4 GRUB 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jun 2002 16:40:13 +0100
Message-ID: <14458.1024414813@redhat.com>
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
>  i have learnt from the list that we need to make room for GRUB on DOC
> ,how do i do that,david suggested to use DFORMAT,can any1 give me the
> exact cmd to do that? i dont want to use ntfl_format due to poor block
> handling 

You can tell DFORMAT how much space to leave for the firmware -- try the 
/HELP option or something. We don't yet know how to turn our grub_firmware 
binary into a .EXB file which DFORMAT will write to the flash _for_ us. 
That would be a nice development -- it shouldn't be too hard to work out 
how that file works.

You need to build grub according to the documentation and then see how 
large the resulting binary is -- _that_ is the amount of space you need to 
reserve.

--
dwmw2
