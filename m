Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aB2R-0002eH-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 08:05:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B8533A2.8BA7729C@possio.com> 
References: <3B8533A2.8BA7729C@possio.com> 
To: Stefan Thomasson <st@possio.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question about cfi_cmdset_0001.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 24 Aug 2001 08:11:36 +0100
Message-ID: <10214.998637096@redhat.com>
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

st@possio.com said:
> I have discovered some problems with the strataflash memory and resets
>  on our board (strongarm assabet clone), 

You cloned an Assabet - and you didn't fix the fact that in a fit of
stupidity they didn't bother to connect the reset line to the flash chips?

I have no sympathy for you :)

Yes, we could make the flash drivers leave the chips in state FL_READY more 
often. No, it wouldn't make it robust - only slightly less likely to break.


--
dwmw2
