Received: from wa-out-1112.google.com ([209.85.146.183])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ib5Qw-0005Uo-6L
	for linux-mtd@lists.infradead.org; Fri, 28 Sep 2007 03:18:28 +0100
Received: by wa-out-1112.google.com with SMTP id v33so3229135wah
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Sep 2007 19:18:02 -0700 (PDT)
Message-ID: <f5d360820709271917nb156587v5d3f8262abb760ba@mail.gmail.com>
Date: Fri, 28 Sep 2007 11:17:57 +0900
From: "Kang-Nyeon Kim" <kangnuni@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: delay time of nandsim
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I found nandsim has delay options like access_delay ( read delay ),
program_delay( write delay ) and erase_delay.

Does it guarantee delay time strictly?

It seems that nandsim would allocate memory using vmalloc function.
those memory spaces could be swapped out.

When I set access_delay to 20us,
If required data was in hard disk, nandsim could not finish required
operation in given delay time because read data from hard disk takes
longer time than 20us.

How resolve this problem in nandsim?

-- 
Best regards,

Kang-Nyeon Kim
