Received: from qw-out-1920.google.com ([74.125.92.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCjTN-0008TA-TK
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 00:09:28 +0000
Received: by qw-out-1920.google.com with SMTP id 4so1089100qwk.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Jun 2009 17:09:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a1fb7300906022244g5cd882acw7de4b9b0ecc35547@mail.gmail.com>
References: <a1fb7300906022244g5cd882acw7de4b9b0ecc35547@mail.gmail.com>
Date: Sat, 6 Jun 2009 07:03:05 +0700
Message-ID: <a1fb7300906051703p148c5d1k7fd46257c8031ac6@mail.gmail.com>
Subject: Confuse with WL_THRESHOLD
From: Thang Dao Duy <hanbaoquansexy@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone.
I used NANDsim and ubifs not for along time. Now, I have confused with
wear-leveling threshold. If i give parameter WL_THRESHOLD in Kernel is
small (example, the value is=A0 3), then when i write a file size 2 MiB
to NAND about 200 times, it makes me cannot read EC and VID headers of
one PEB (example PEB 10). May be that PEB is bad ? And when i set the
WL_THRESHOLD is higher (the value is 20), i write a file 2MiB about
1000 times, nothing 's happen, i can read headers of any PEB. So can
you tell me what make this happen, and show me where in ubi source in
kernel.
Thanks.
