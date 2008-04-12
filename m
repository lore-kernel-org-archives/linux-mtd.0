Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JkVrW-0003DZ-Vn
	for linux-mtd@lists.infradead.org; Sat, 12 Apr 2008 02:53:07 +0000
Received: by wf-out-1314.google.com with SMTP id 29so750798wff.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Apr 2008 19:53:05 -0700 (PDT)
Message-ID: <9c9fda240804111953s1ef73ecbh4e648a740c77dd0f@mail.gmail.com>
Date: Sat, 12 Apr 2008 11:53:05 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: dedekind@infradead.org,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Question about the size limitation of UBI
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

It's similar question with MTD size limitation. If I have a 16GiB, or
32GiB NAND, then does UBI support this chips?
or similarly it needs to modify its fields?

I saw the UBI2 word I don't remember the which mail.
Anyway as you know it has a scalability problem. It scans all blocks.
So do you have any plan to address this one? or any ideas?

Thank you,
Kyungmin Park
