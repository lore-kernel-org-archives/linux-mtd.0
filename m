Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHxt9-0001Iq-Ll
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 15:56:16 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
 <877g8ojqsn.fsf@nbsps.com> <53079725.6080105@nod.at>
 <87ios8gsho.fsf@nbsps.com> <87k3coq8di.fsf@nbsps.com>
 <530860B1.9000808@nod.at> <877g8kr1h7.fsf@nbsps.com>
 <530B670B.3090002@nod.at> <87sir8ms41.fsf@nbsps.com>
Date: Mon, 24 Feb 2014 10:48:33 -0500
In-Reply-To: <87sir8ms41.fsf@nbsps.com> (Bill Pringlemeir's message of "Mon,
 24 Feb 2014 10:45:50 -0500")
Message-ID: <87ob1wmrzi.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Wiedemer, Thorsten \(Lawo AG\)" <Thorsten.Wiedemer@lawo.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 Feb 2014, bpringlemeir@nbsps.com wrote:

> /* could reschedule here... */
> on 'if (vol->eba_tbl[lnum] != from)' another thread has this
> 'ltree_entry' so count is >1.
> /* could reschedule here... */

Sorry, maybe that is not true.  I don't know enough about the logic of
ubi_eba_copy_leb().  Another thread has at least changed the physical
map.  It may/may not still have the rwsemaphore.
