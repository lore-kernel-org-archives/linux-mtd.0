Received: from mx1.riseup.net ([198.252.153.129])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TZTLD-0005UW-Em
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 21:20:48 +0000
From: micah anderson <micah@riseup.net>
To: dedekind1@gmail.com
Subject: Re: UBIFS error (pid 564): read_znode: bad indexing node at LEB
 484:66064, error 2
In-Reply-To: <87obixil6r.fsf@minnow.riseup.net>
References: <87625h85fd.fsf@minnow.riseup.net>
 <1353054666.3618.6.camel@sauron.fi.intel.com>
 <87obixil6r.fsf@minnow.riseup.net>
Date: Fri, 16 Nov 2012 16:20:37 -0500
Message-ID: <87a9uhi6sa.fsf@minnow.riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

micah anderson <micah@riseup.net> writes:

> Artem Bityutskiy <dedekind1@gmail.com> writes:

>> No, there is no recovery program, the file-system is supposed to always
>> be mountable. Please, use mtdtests to validate the HW:
>>
>> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

I dont have these already built on my system, and it doesn't appear that
they are in the debian package mtd-utils. 

Can you tell me what specifically I should run if I were to get these
built? Some of these look destructive, some of them I cannot tell if
they are destructive or not, and some of them seem like they aren't
relevant (speed tests), but I'm out of my league here, so any pointers
would be very helpful!

micah
