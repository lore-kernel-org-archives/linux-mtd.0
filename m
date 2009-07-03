Received: from qw-out-1920.google.com ([74.125.92.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MMcn3-0004cJ-TO
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 07:02:53 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1203547qwf.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jul 2009 00:02:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <077E41CFFD002C4CAB7DFA4386A53264F5D812@DEMUEXC014.nsn-intra.net>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<1246373088.20721.11.camel@localhost.localdomain>
	<8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
	<1246603942.20721.29.camel@localhost.localdomain>
	<077E41CFFD002C4CAB7DFA4386A53264F5D812@DEMUEXC014.nsn-intra.net>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 3 Jul 2009 03:02:11 -0400
Message-ID: <8bd0f97a0907030002y521723a4s42e71dbb63e7e502@mail.gmail.com>
Subject: Re: Compile Error: structure has no member named lowest_vol_num
To: "Biefel, Reiner (NSN - DE/Munich)" <reiner.biefel@nsn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/7/3 Biefel, Reiner
> BTW: I don't understand why nobody else did have this problem till now.

in my summary:

>> the CPPFLAGS in the env changes how make initializes/appends CPPFLAGS

people rarely set CPPFLAGS
-mike
