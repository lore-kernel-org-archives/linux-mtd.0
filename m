Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bP0x-0001qJ-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2001 17:13:27 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.0-24 #47347)
 id <0GIQ00M01IN9UT@asu.edu> for linux-mtd@lists.infradead.org; Mon,
 27 Aug 2001 09:18:46 -0700 (MST)
Date: Mon, 27 Aug 2001 09:19:06 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: RE: Dynamic Rubin compression performance in JFFS2 on iPAQ
In-reply-to: 
 <D99C1FB421989A40818B6370E3187094C8E2F5@tayexc19.americas.cpqcorp.net>
To: "Christian, Andrew" <Andrew.Christian@compaq.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 "Hicks, Jamey" <Jamey.Hicks@compaq.com>
Message-id: <998929146.20037.1.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: 
 <D99C1FB421989A40818B6370E3187094C8E2F5@tayexc19.americas.cpqcorp.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 27 Aug 2001 12:09:41 -0400, Christian, Andrew wrote:
> I should have mentioned that we started with your stuff, and modified it.
> The major change is to cache the scanned dirnodes so directory traversals
> are faster, and allowed us to add an "ls" command from the bootloader.
> 
> 	Brian Avery		<brian.avery@compaq.com>
> 
> 

ok, so certian images aren't decompressing DYNRUBIN compressed files
properly? Were you aware of the usermode debugging mode? Send me over
what you have, along with the image that fails and the correctly
decompressed file.
