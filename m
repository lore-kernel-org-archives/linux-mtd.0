Received: from smtp1.ascom-ws.com ([195.81.148.76] helo=mail.ascom-ws.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzQkR-000767-4B
 for linux-mtd@lists.infradead.org; Wed, 26 Oct 2016 16:08:19 +0000
From: Danesh Daroui <Danesh.Daroui@ascom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: OOB Test fails
Date: Wed, 26 Oct 2016 16:07:20 +0000
Message-ID: <39BC08CB3FF4C84CB6397533D4FC79095770D513@SEGOTEXCH02.ascom-Resource.ads>
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

Hello all,

I have executed MTD tests against an unmounted MTD device which uses UBIFS.=
 All MTD tests except OOB test is passed where the OOB test fails from time=
 to time and from device to device. I have read here:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_why_no_oob

that UBIFS does not use OOB area. Therefore wanted to ask if failing this t=
est does not need that there is any problem in our system (both HW and SW/c=
onfiguration) and we can safely ignore the results for this test.

Thanks in advance,

Danesh Daroui
