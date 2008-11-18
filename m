Received: from venus.billgatliff.com ([209.251.101.201])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L2Qd1-0002Jw-Dt
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 13:28:27 +0000
Message-ID: <4922C2F5.2000306@billgatliff.com>
Date: Tue, 18 Nov 2008 07:28:21 -0600
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: Peter Jolasson <peter.jolasson@gmail.com>
Subject: Re: read-only problem with mtd
References: <c69bda8c0811180140i3e3ac35ai306fbd4dfcf976d3@mail.gmail.com>
In-Reply-To: <c69bda8c0811180140i3e3ac35ai306fbd4dfcf976d3@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Peter Jolasson wrote:
> (Something like reboot and specifying a new cmdline would be nice)

I suggest you reboot and specify a new command line.  :)

But seriously, the trick to that might be finding the area in the
bootloader flash that corresponds to the kernel command line.  But if
the target supports kexec, you might be able to just pass in a new
command line on the, er, command line...  That would be equivalent to
the above, but without having to modify any flash.

Here is an alternative to consider, though.  If you can modify the
rootfs, then could you add in a kernel module that, when loaded, would
undo the physmap for the kernel partition and replace it with one that
isn't read-only?

Note that I'm not sure that the "undo" part in the above is
technically possible.  I'll leave that as an exercise to the
implementer.  :)


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
