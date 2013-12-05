Date: Thu, 5 Dec 2013 13:32:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnaud Ebalard <arno@natisbad.org>
Subject: Re: [PATCH v5 00/14] Armada 370/XP NAND support
Message-ID: <20131205213242.GN27149@ld-irv-0074.broadcom.com>
References: <87wqjtbm8r.fsf@natisbad.org> <20131128185040.GA13182@localhost>
 <87bo12kcyt.fsf@natisbad.org> <20131202103305.GB2466@localhost>
 <87siubneuf.fsf@natisbad.org> <20131203002225.GA5333@localhost>
 <87ob4xbs8l.fsf@natisbad.org> <87iov5aapx.fsf@natisbad.org>
 <20131204142009.GB2486@localhost> <87haaogx6j.fsf@natisbad.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87haaogx6j.fsf@natisbad.org>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 04, 2013 at 09:48:04PM +0100, Arnaud Ebalard wrote:
> Now, I am starting to wonder if nandwrite does not try and do something
> smart depending on the content of the file.

nandwrite does not do any data-dependent operations. It only checks the
size of the file to verify against MTD alignment restrictions, but
otherwise, it is simply a dump page-at-a-time programmer.

However, there are other characteristics which do differentiate it from
dd, so it's not surprising if nandwrite can uncover different code
behaviors than dd.

(BTW, I wouldn't recommend dd for NAND programming. It may be useful for
certain debugging purposes, but it ignore bad blocks and is generally
dangerous to use for any regular purposes.)

Brian
