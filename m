Received: from mail128.messagelabs.com ([216.82.250.131])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwyVj-0003ne-NA
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 12:26:24 +0000
Received: from il06exr02.mot.com (il06exr02.mot.com [129.188.137.132])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id mA3CQLkp003073
	for <linux-mtd@lists.infradead.org>;
	Mon, 3 Nov 2008 05:26:21 -0700 (MST)
Received: from il06vts04.mot.com (il06vts04.mot.com [129.188.137.144])
	by il06exr02.mot.com (8.13.1/Vontu) with SMTP id mA3CQKX8005818
	for <linux-mtd@lists.infradead.org>;
	Mon, 3 Nov 2008 06:26:20 -0600 (CST)
Received: from ZMY16EXM67.ds.mot.com (zmy16exm67.ap.mot.com [10.179.4.27])
	by il06exr02.mot.com (8.13.1/8.13.0) with ESMTP id mA3CQJUm005813
	for <linux-mtd@lists.infradead.org>;
	Mon, 3 Nov 2008 06:26:20 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: MTD password protection
Date: Mon, 3 Nov 2008 20:26:17 +0800
Message-ID: <B7803DC652E2F9458758AEBB6A5FD60F033A3BE0@ZMY16EXM67.ds.mot.com>
In-Reply-To: <mailman.3.1225645202.29354.linux-mtd@lists.infradead.org>
From: "KRISHNAN SUDHAKAR-NRD743" <sudhakark@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Presently I am working on password protection for sector in spansion
flash.

I am new to Linux I understood the MTD code flow like the following

1) The mtd erase operation goes through like the following
mtdchar.c -> cfi_cmdset_0002.c -> cfi_util.c -> erase the flash(?) ->
cfi_cmdset_0002.c (call back) -> mtdpart.c(callback) ->
mtdchar.c(callback)
=20
2) In "cfi_cmdset_0002.c" the "mtd->erase" will be pointed to
"cfi_amdstd_erase_varsize"
    2.1) In "mtdchar.c"  case MEMERASE uses the mtd->erase pointed in
"cfi_cmdset_0002.c" I.e. "cfi_amdstd_erase_varsize"
    2.2) The "cfi_amdstd_erase_varsize" uses the call back function
"mtd_erase_callback" (mtdpart.c)
=20
Please let me know is my understanding is correct?

I have proceeded like,=20
1) I have written utility "passread" which will take sector id as
parameter.=20
2) In mtdchar.c ioctl function added one switch case.
3) In the mtdchar.c switch case, through function pointer calling the
function in "cfi_cmdset_0002.c"
4) In cfi_cmdset_0002.c file initialized the mtd->passread with the
fucntion I need to call in "*cfi_cmdset_0002" function.


Finally ended with "Segmentation fault" in mtdchar.c during the function
pointer calling.

I believe that the mtd->passread is not initialized. But I have
initialized the same in "*cfi_cmdset_0002" function but still getting
error and don't know how to do that.

Please suggest me what wrong I have did?

Regards
Sudhakar
