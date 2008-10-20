Received: from nf-out-0910.google.com ([64.233.182.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KruJy-0007pJ-O3
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 12:57:19 +0000
Received: by nf-out-0910.google.com with SMTP id d21so756128nfb.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 05:57:17 -0700 (PDT)
To: dedekind@infradead.org
Subject: Re: [RFC] ubi: tmp hack for lstat
References: <20081019132122.GA20282@www.tglx.de>
	<1224479637.4466.55.camel@sauron> <20081020091100.GA1324@www.tglx.de>
	<1224494471.4466.90.camel@sauron>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Oct 2008 14:57:14 +0200
In-Reply-To: <1224494471.4466.90.camel@sauron> (Artem Bityutskiy's message of
	"Mon\, 20 Oct 2008 12\:21\:11 +0300")
Message-ID: <87bpxfifv9.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind@infradead.org> writes:

Hi,

 Artem> On Mon, 2008-10-20 at 11:11 +0200, Sebastian Andrzej Siewior wrote:
 >> I'm actually not sure what the expected behavior is. stat() returns
 >> information about a file and ubi isn't a regular file it is a character
 >> node. So it would be probably better to leave everything as it and
 >> change userspace instead.

 Artem> In my understanding, stat() should return how many bytes of
 Artem> data inode contains. Stat on a character device should return
 Artem> amount of bytes the character device inode contain. In ext3
 Artem> major/minor are stored as meta-data, so it returns 0.

Exactly. The normal way to know the size of these things is to open
them and do the lseek(fd, 0, SEEK_END) thing.

-- 
Bye, Peter Korsgaard
