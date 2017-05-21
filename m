Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCYgp-00057e-Uq
 for linux-mtd@lists.infradead.org; Sun, 21 May 2017 21:47:05 +0000
Subject: Re: [PATCH] mkfs.ubifs: Add support for symlinks in device table
To: David Engraf <david.engraf@sysgo.com>
References: <20170518133854.20744-1-david.engraf@sysgo.com>
 <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
 <09400658-229c-b985-75d4-7df184e4be47@sysgo.com>
 <d41978aa-9583-6a27-d992-77a49962daed@nod.at>
 <678b2b7a-4f2e-5bfe-1f10-61de599a59bb@sysgo.com>
 <652cc3d4-10a2-d476-c4b1-63eff6aa2ea7@nod.at>
 <dc1e73ec-537b-8e23-6dab-0ce4c2e371a7@sysgo.com>
 <97e661e2-0648-e148-280b-8ff6cc9cbe09@nod.at>
 <9e19f6f3-e825-72b4-cf5e-fea2c12a5c7e@nod.at>
 <9e37787a-3683-1417-a03e-8a00022a44ff@sysgo.com>
 <3ecf5d12-6a22-58a2-b799-bd70a141a646@nod.at>
 <6097f46d-d50a-2360-01a5-9fdec4ffd338@sysgo.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <a6b95f58-56cb-7b28-7433-ecb21207fcfb@nod.at>
Date: Sun, 21 May 2017 23:46:38 +0200
MIME-Version: 1.0
In-Reply-To: <6097f46d-d50a-2360-01a5-9fdec4ffd338@sysgo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Am 19.05.2017 um 10:47 schrieb David Engraf:
> We could also force symlinks to 777 and return an error if the user tries to use a different value. What do you think?

Exactly. :-)

Thanks,
//richard
