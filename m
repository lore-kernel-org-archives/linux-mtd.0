Subject: Re: New thread [BUG] JFFS2 usage of write_begin and write_end
	functions causes kernel panic
From: David Woodhouse <dwmw2@infradead.org>
To: James <jamessteward@optusnet.com.au>
In-Reply-To: <1210312276.28139.19.camel@Ubuntu-Desktop>
References: <1210312276.28139.19.camel@Ubuntu-Desktop>
Content-Type: text/plain
Date: Fri, 09 May 2008 09:12:11 +0100
Message-Id: <1210320731.25560.1193.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-09 at 15:51 +1000, James wrote:
> I've just subscribed.  I saw this in the archives and it matches
> exactly what I'm seeing on an AT91SAM9263-EK board.  I have 4 such
> boards.  2 work ok, the other 2 exhibit this problem.  I'm using
> 2.6.24 + patches from linux4sam.org.  I'm using soft ECC.  There are
> no bad blocks detected by U-boot.

You possibly need the patch in commit abe2f4143?

> I realise I should not have started a new thread, so is there a way I
> could reply to a message on the list archive?

The first link on the archived mail, despite appearing to be the address
of the person who sent the mail, actually has a mailto: link which will
send mail to the list -- and will get the threading right, if your MUA
is behaving itself properly.

-- 
dwmw2
