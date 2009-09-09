Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MlOGW-0007IU-NY
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 14:35:25 +0000
Message-ID: <4AA7BD3C.7080302@nokia.com>
Date: Wed, 09 Sep 2009 17:35:40 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: =?EUC-KR?B?yKu9xSBzaGluIGhvbmc=?= <hongshin@gmail.com>
Subject: Re: UBIFS: possible bug for the absence of memory barrier
References: <2014bcab0909090722t101657b1vf698607aae62e53e@mail.gmail.com>
In-Reply-To: <2014bcab0909090722t101657b1vf698607aae62e53e@mail.gmail.com>
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

È«½Å shin hong wrote:
> Hello. I am reporting the possible bugs caused by absence of memory barriers.
> 
> Since I do not have much background,
> I can not convince that the codes are buggy.
> But I hope that this report is helpful.
> Please examine the issue and let me know your opinion.
> 
> In add_replay_bud() of UBIFS in Linux 2.6.30.5, it newly allocate a bud_entry
> object and initialize and then link it to the replay_buds list.
> 
> The last initialization operation is "b->sqnum = sqnum ;" and
> the linking to the list "list_add_tail(&b->list, &c->replay_buds;".
> 
> However, since there is no memory barrier between these two,
> the execution order might be changed
> so that uninitialized data might be accessible to other threads.
> 
> Therefore, race condition might occur and it may result error.
> 
> Please examine this issue.
> Thank you
> 
> Sincerely
> Shin Hong

A race is not possible because there is only one thread that can be
replaying because it is only done when mounting.
