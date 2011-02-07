Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmT0c-0000yh-BE
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 15:28:11 +0000
Received: by bwz5 with SMTP id 5so5289467bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Feb 2011 07:28:07 -0800 (PST)
Subject: Re: mount ubi volume fails: No such device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lh_post@yahoo.com>
In-Reply-To: <130828.38998.qm@web30203.mail.mud.yahoo.com>
References: <130828.38998.qm@web30203.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Feb 2011 17:27:13 +0200
Message-ID: <1297092433.5938.11.camel@localhost>
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

On Mon, 2011-02-07 at 07:05 -0800, Lars Michael wrote:
> UBI: scrubbed PEB 863, data moved to PEB 1097 UBI warning: ubi_eba_copy_leb: read data back from PEB 1092 and it is different UBI error: wear_leveling_worker: error -22 while moving PEB 868 to PEB 1092 UBI warning: ubi_ro_mode: switch to read-only mode UBI error: do_work: work failed with error code -22 UBI error: ubi_thread: ubi_bgt0d: work failed with error code -22

It says you that it wrote some date, then read it back, compared, and
the data did not match. You need to start with validating your falash
drivers - use mtd tests:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
