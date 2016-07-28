Received: from mail-ve1eur01on0111.outbound.protection.outlook.com
 ([104.47.1.111] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSexH-0007WF-ED
 for linux-mtd@lists.infradead.org; Thu, 28 Jul 2016 06:38:04 +0000
From: "Zhou, John (Nokia - CN/Hangzhou)" <john.zhou@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: how to create one ubifs image support both for different page size
 and sector size?
Date: Thu, 28 Jul 2016 06:37:37 +0000
Message-ID: <DB4PR07MB062499D49F50F0923E2DE33BF2000@DB4PR07MB0624.eurprd07.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Experts

I am facing a problem about one flash image support for both spansion and m=
icron flash chip which has different page/sector size.

What means if I create the flash image from spansion chip , it can't be use=
d on micron chip, vice versa.

Do you know how to solve this problem?

Many thanks for your help!

Brs
John
