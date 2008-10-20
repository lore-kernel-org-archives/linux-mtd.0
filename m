Date: Mon, 20 Oct 2008 11:11:00 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC] ubi: tmp hack for lstat
Message-ID: <20081020091100.GA1324@www.tglx.de>
References: <20081019132122.GA20282@www.tglx.de>
	<1224479637.4466.55.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1224479637.4466.55.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2008-10-20 08:13:57 [+0300]:

>Hi,
Hi,

>I've tried to stat various files in my /dev/ and all of them have size
>0. 
None of them is a file filestem so no one of them returns something.

>Why UBI should be different? 
As I made the patch I though that this is the expectingt behavior.
sda/hda return 0 but those are larger then a few MiBs so you use a fs on
top. So either nobody care(s|d) or it works as expected.

>Indeed, stat should return size of the
>inode, that is normal semantics. You suggest making stat on UBI volume
>character devices return volume size. It might help your application,
>but it'll confuse other applications - for example 'du', which uses stat
>to calculate directory size. So am not sure it is good idea.
It would report the size you would get after a read(). A cp()1 on ubi
would copy the content of the node unless called with -a.

I'm actually not sure what the expected behavior is. stat() returns
information about a file and ubi isn't a regular file it is a character
node. So it would be probably better to leave everything as it and
change userspace instead.

>Best regards,
>Artem Bityutskiy (???????????????? ??????????)

Sebastian
