Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSnbP-0000vl-6e
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 09:24:51 +0000
Received: by bwz14 with SMTP id 14so1913591bwz.30
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 01:24:49 -0800 (PST)
Subject: Re: About NAND Simulator question
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=E8=98=87=E5=81=89=E6=88=A9?= <jian3695963@gmail.com>
In-Reply-To: <AANLkTimDuh_HOpBfSQf9nC5N0wQBh0Zb3aBz49o0Kk26@mail.gmail.com>
References: <AANLkTimDuh_HOpBfSQf9nC5N0wQBh0Zb3aBz49o0Kk26@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Dec 2010 11:24:21 +0200
Message-ID: <1292405061.2512.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

please, send all e-mails concerning nandsim to
linux-mtd@lists.infradead.org, you can also CC me, I prefer using "Artem
Bityutskiy <dedekind1@gmail.com>"

On Tue, 2010-11-30 at 17:57 +0800, 蘇偉戩 wrote:
> When i read your code,I can understand the Simulator has file-base and
> RAM-backed emulation

Yes.

> But I have question is weather the file-base emulation can simulate
> the flash memory's performance.

No, I do not think so. Originally I added some things like delays
emulation, but then never used that, and I do not think that is correct.
I think we better remove that functionality to confuse people less. Or
someone should actually fix that.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
