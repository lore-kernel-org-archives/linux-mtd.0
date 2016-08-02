Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUTkF-0006VK-Ex
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 07:04:08 +0000
Subject: Re: how to create one ubifs image support both for different page
 size and sector size?
To: "Zhou, John (Nokia - CN/Hangzhou)" <john.zhou@nokia.com>
References: <DB4PR07MB062499D49F50F0923E2DE33BF2000@DB4PR07MB0624.eurprd07.prod.outlook.com>
 <CAFLxGvz+5rKiK5si4XtPKkHtJwJ=nub6xDMxOyMfYqQZrdzRLA@mail.gmail.com>
 <AM3PR07MB075848DCD6F716812516B216F2050@AM3PR07MB0758.eurprd07.prod.outlook.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57A045CA.8070302@nod.at>
Date: Tue, 2 Aug 2016 09:03:38 +0200
MIME-Version: 1.0
In-Reply-To: <AM3PR07MB075848DCD6F716812516B216F2050@AM3PR07MB0758.eurprd07.prod.outlook.com>
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

John,

Am 02.08.2016 um 08:35 schrieb Zhou, John (Nokia - CN/Hangzhou):
> How other users to solve such problem? When we need support for two different flash?
> Two images is the only path?

This is correct. Is this such a big problem?
Another approach is booting Linux and create UBI/FS on the fly...

Thanks,
//richard
