Received: from nz-out-0102.google.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GcLTL-000160-CU
	for linux-mtd@lists.infradead.org; Tue, 24 Oct 2006 08:33:50 -0400
Received: by nz-out-0102.google.com with SMTP id r28so667176nza
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Oct 2006 05:33:32 -0700 (PDT)
Message-ID: <c384c5ea0610240533n2b14352n8e9ff91081d6765f@mail.gmail.com>
Date: Tue, 24 Oct 2006 14:33:31 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Using NAND on the Intel XScale IXP42x expansion bus?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hello all,


on a IXP42x platform we need lots (1GB) of flash storage (for
secondary storage).

CF is one option we are looking into, NAND is another.

Is there proper support in Linux 2.6 to hang synchronous parallel NAND
chips directly off the expansion bus?

I would like to work from an existing proven solution. I did find some
relevant emails, know there are some small consumer devices (Iomega
NAS) that have NAND, but would like a clearer picture on this, or
tips.

http://lists.infradead.org/pipermail/linux-mtd/2005-April/012384.html


With kind regards,
-- 
Leon
