Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mku64-00060t-DH
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 06:22:36 +0000
Subject: Re: UBIFS power cut issues
From: Artem Bityutskiy <dedekind1@gmail.com>
To: JiSheng Zhang <jszhang3@gmail.com>
In-Reply-To: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Sep 2009 09:22:16 +0300
Message-Id: <1252390936.5060.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

sorry for late answer, was very busy.

On Wed, 2009-09-02 at 17:35 +0800, JiSheng Zhang wrote:
> If we cut power when copy file into ubifs, then remount ubifs and try
> to read the file, we found that the data at some offset of the file
> began different from the data of the original file at the same offset.
> Is this a bug of ubifs?

This is expected behavior on any asynchronous FS. You may switch to
synchronous behavior with '-o sync' mount option. I wrote a lot of
docs about write-back and the related issues. Dig UBIFS docs and FAQ.
E.g.:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_empty_file
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback

If you have a _specific_ question, feel free to ask, of course. But
for this general question I do not have a better answer than RTFM
:-)))

> PS:how do you test data integrity of ubifs under power loss?

We mostly checked it using either 'integck' (see mtd-utils) or
'fsstress' (see LTP). We ran those tests and cut power off at random
points using these devices:

http://www.cpscom.com/gprod/ipn.htm

Then we mounted the FS. We did not really check the contents of the
FS, because it is not simple and tricky, but we checked that it mounts,
re-mounts, and files are readable/writable/deletable.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
