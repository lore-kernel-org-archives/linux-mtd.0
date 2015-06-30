Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9ugg-0001GR-I9
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 12:30:55 +0000
Message-ID: <55928BE5.5030900@nod.at>
Date: Tue, 30 Jun 2015 14:30:29 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Brokhman, Tanya" <tlinder@codeaurora.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 reddyn@codeaurora.org
Subject: Re: ubifs_recover_leb() failure
References: <558C04BD.7030101@codeaurora.org> <558C0612.7070309@nod.at>
 <559281F7.5070908@codeaurora.org>
In-Reply-To: <559281F7.5070908@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tanya,

Am 30.06.2015 um 13:48 schrieb Brokhman, Tanya:
>> Currently I have a similar corruption to analyze on my desk. Maybe you're hitting the same one.
>> If you can trigger the issue using a fully patched kernel, I'd love to get a copy of the corrupted image.
> 
> Thank you for your inputs!
> Unfortunately I'm bound by our legal team from sharing any images.

Very sad. :-(

> Applying all of the FM patches didn't go easily, so we did a different test - tried to disable fastmap and reproduce the issue. We're hitting bitflips now but the original issue is
> not reproduced and the build is significantly more stable now.
> Hope this helps you with your issue.

Currently it looks more like a BSP issue. But investigation is still ongoing.

Thanks,
//richard
