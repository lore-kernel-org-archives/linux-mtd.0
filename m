Received: from nz-out-0102.google.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeDBW-0005Kr-9V
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 11:34:44 -0400
Received: by nz-out-0102.google.com with SMTP id z6so190629nzd
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 May 2006 08:34:37 -0700 (PDT)
Message-ID: <c384c5ea0605110834x620d00d8l2b105aa91adb2b0c@mail.gmail.com>
Date: Thu, 11 May 2006 17:34:37 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [PATCH URL] MTD: CHIPS Do not oops when configured flash size is
	less then chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

please review this patch:

http://www.esrac.ele.tue.nl/~leon/linux/patches/prevent_chip_size_exceeds_c=
onfig_oops.patch
http://www.esrac.ele.tue.nl/~leon/linux/patches/prevent_chip_size_exceeds_c=
onfig_oops.txt

Regards,
--=20
Leon

(an earlier message with the patch inside was held back for approval)
