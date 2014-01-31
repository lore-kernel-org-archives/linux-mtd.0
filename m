Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W99LM-0000fH-AW
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 08:20:57 +0000
Message-ID: <52EB5CCE.5080609@nod.at>
Date: Fri, 31 Jan 2014 09:20:30 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrew Ruder <andrew.ruder@elecsyscorp.com>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [HACK] fs/super.c: sync ro remount after blocking writers
References: <1391095614-21554-1-git-send-email-andrew.ruder@elecsyscorp.com>
In-Reply-To: <1391095614-21554-1-git-send-email-andrew.ruder@elecsyscorp.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: Christoph Hellwig <hch@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.01.2014 16:26, schrieb Andrew Ruder:
> Move sync_filesystem() after sb_prepare_remount_readonly().  If writers
> sneak in anywhere from sync_filesystem() to sb_prepare_remount_readonly()
> it can cause inodes to be dirtied and writeback to occur well after
> sys_mount() has completely successfully.
> 
> This was spotted by corrupted ubifs filesystems on reboot, but appears
> that it can cause issues with any filesystem using writeback.

Link to original report:
http://lists.infradead.org/pipermail/linux-mtd/2014-January/051651.html

What we see is that writeback still happens after mounting the fs ro.

Thanks,
//richard
