Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJJhY-0003tf-10
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2014 09:25:53 +0000
Message-ID: <53105604.4050501@nod.at>
Date: Fri, 28 Feb 2014 10:25:24 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>,
 Andrew Ruder <andrew.ruder@elecsyscorp.com>
Subject: Re: [HACK] fs/super.c: sync ro remount after blocking writers
References: <1391095614-21554-1-git-send-email-andrew.ruder@elecsyscorp.com>
 <20140203102303.GB11829@infradead.org>
In-Reply-To: <20140203102303.GB11829@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
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

Andrew,

Am 03.02.2014 11:23, schrieb Christoph Hellwig:
> On Thu, Jan 30, 2014 at 09:26:54AM -0600, Andrew Ruder wrote:
>> Move sync_filesystem() after sb_prepare_remount_readonly().  If writers
>> sneak in anywhere from sync_filesystem() to sb_prepare_remount_readonly()
>> it can cause inodes to be dirtied and writeback to occur well after
>> sys_mount() has completely successfully.
>>
>> This was spotted by corrupted ubifs filesystems on reboot, but appears
>> that it can cause issues with any filesystem using writeback.
> 
> From the link that Richard posted it seems like you have a testcase.
> Can you please integrate it into xfstests so that we can properly
> regression test for this issue from now on?

Is it possible to create such a test case?
I don't know whether it is possible to trigger the issue on
a regular filesystem.
But as hch noted, it would be nice to have. :)

Thanks,
//richard
