Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPNk4-0007Qf-TR
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 05:38:54 +0000
Subject: Re: [PATCH for-4.8] ubifs: silence early error messages if MS_SILENT
 is set
To: Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org
References: <20160718222649.GA17394@makrotopia.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <578DBCD4.6070305@nod.at>
Date: Tue, 19 Jul 2016 07:38:28 +0200
MIME-Version: 1.0
In-Reply-To: <20160718222649.GA17394@makrotopia.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.07.2016 um 00:26 schrieb Daniel Golle:
> Probe-mounting a volume too small for UBIFS results in kernel log
> polution which might irritate users.
> Address this by silencing errors which may happen during boot if the
> rootfs is e.g. squashfs (and thus rather small) stored on a UBI volume.
> This commit should be seen in context with
> commit 65fb47721925628bf85ec08c4302ac5e7224a66a
> and
> commit 90bea5a3f0bf680b87b90516f3c231997f4b8f3b

The diff makes sense but not the commit message.
Why would you mount a squashfs on top of UBI as UBIFS?
We have rootfstype= for this.

Thanks,
//richard
