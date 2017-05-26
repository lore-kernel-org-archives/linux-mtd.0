Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEBvn-0008Qs-1D
 for linux-mtd@lists.infradead.org; Fri, 26 May 2017 09:53:17 +0000
Subject: Re: [PATCH] ubifs: Add freeze support
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at>
Date: Fri, 26 May 2017 11:52:42 +0200
MIME-Version: 1.0
In-Reply-To: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hyunchul,

Am 26.05.2017 um 01:30 schrieb Hyunchul Lee:
> From: Hyunchul Lee <cheol.lee@lge.com>
> 
> for un/freeze support, implement freeze_super and un/freeze_fs
> of super_operations.
> ubifs_freeze_super just calls freeze_super. because freeze_super always
> succeeds if file system is read-only,  UBIFS errors should be checked.
> if there are errors, UBIFS is switched to read-only mode.
> ubifs_freeze_fs runs commit if TNC/LPT isn't clean. though all writes
> are blocked and sync_fs is called before, if commit alreay was started
> before writes are blocked, TNC/LPT might have dirty COW nodes.

you explain how you implement that feature, but not why.
What is the use-case?
I always thought this interface is only being used by LVM.

Thanks,
//richard
