Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2fLq-0004qZ-M7
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 12:43:28 +0000
Message-ID: <557830D4.3000301@nod.at>
Date: Wed, 10 Jun 2015 14:43:00 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Brokhman, Tanya" <tlinder@codeaurora.org>,
 Smitha Rathnam <rathnam.smitha@gmail.com>
Subject: Re: Trouble with UBIFS
References: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
 <CAFLxGvzA8N4PUK_7-jM9FcnrqLnyOsNcomfLOSMMGKc5Ed5D9Q@mail.gmail.com>
 <557825BA.6030104@codeaurora.org>
In-Reply-To: <557825BA.6030104@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tanya,

Am 10.06.2015 um 13:55 schrieb Brokhman, Tanya:
>> Retrieving data from the filesystem is not easy, it depends how much UBIFS
>> is corrupted.
>> What I do in such cases is dumping all nodes and running them thought a
>> semi-automated script which can deal with UBIFS.
> Could you please share the script? I'm facing same issues at the moment (debugging ubifs corruption). I have a binary dump of the partition. Looking for the most user-friendly tool
> to look at it.

I'll share it as soon it is a) kind of user friendly and b) all legal stuff has been sorted out.
My plan is turning it into something like a fsck.ubfs with a "fuzzy dump" mode.

Thanks,
//richard
