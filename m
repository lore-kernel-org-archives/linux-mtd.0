Message-ID: <49FEA340.7070506@nokia.com>
Date: Mon, 04 May 2009 11:11:44 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: =?EUC-KR?B?yKu9xSBzaGluIGhvbmc=?= <hongshin@gmail.com>
Subject: Re: report a suspected bug in ubifs
References: <2014bcab0904300810qc66605bk9121b1ab66c53ece@mail.gmail.com>	
	<49F9C340.3090304@nokia.com>	
	<2014bcab0904301752x3662f91em3932c7b9730d8558@mail.gmail.com>	
	<49FE9D59.30003@nokia.com>
	<2014bcab0905040059r5ca9b8e1o5bf572ee354f7162@mail.gmail.com>
In-Reply-To: <2014bcab0905040059r5ca9b8e1o5bf572ee354f7162@mail.gmail.com>
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

È«½Å shin hong wrote:
> Thank you for the reply.
> 
> all accesses to 'wbuf->used' is synchronized by 'io_mutex'
> and its updates(writing accesses) are synchronized by 'wbuf_lock'
> like readers/writer lock ?

Yes, it is like a readers/writers lock.

To read from the wbuf, all that is needed is the spin lock.

To append to the wbuf, without otherwise changing it, all that is needed
is the mutex (and then the spin lock to record that the append happened).

To change the wbuf, the mutex *and* the spin lock are needed.
