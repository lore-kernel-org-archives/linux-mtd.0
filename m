Received: from mail-bw0-f160.google.com ([209.85.218.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Vcz-0008VO-Tp
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 08:33:56 +0000
Received: by bwz4 with SMTP id 4so3401358bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 May 2009 01:33:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243238444.21646.65.camel@localhost.localdomain>
References: <1243234150-29786-1-git-send-email-corentincj@iksaif.net>
	<1243236757.21646.54.camel@localhost.localdomain>
	<71cd59b00905250052i6e04efd3j27eeaf35f0495f7f@mail.gmail.com>
	<1243238444.21646.65.camel@localhost.localdomain>
Date: Mon, 25 May 2009 10:33:48 +0200
Message-ID: <71cd59b00905250133l20f39817jdc514568b5f82460@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: Add an error code if the compr is not present
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, May 25, 2009 at 10:00 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Mon, 2009-05-25 at 09:52 +0200, Corentin Chary wrote:
>> For information, this bug was triggered when running an userspace
>> version of ubifs (code available soon).
>> We used the original ubifs to format the partition, but our version
>> didn't support the lzo compressor (now, it do).
>> Then, valgrind/gdb to get a backtrace and "voila".
>
> Userspace ubifs version. Wow! I wonder how it performs comparing
> to the kernel space one.

Well, there is now big change in the code. For performance, it'll
depends of the fuse overhead. We'll see.
The big question is "how writeback will performs".

For the moment it's read-only (except for creating the default
filsystem), in fact our mkfs is just: erase all, mount, unmount.

-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
