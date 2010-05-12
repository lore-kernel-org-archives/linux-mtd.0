Received: from mx1.prosoftsystems.ru ([212.23.72.203])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OC6Tc-0005aF-D0
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 07:35:32 +0000
From: Alexander Pazdnikov <pazdnikov@prosoft.ural.ru>
To: <linux-mtd@lists.infradead.org>
Subject: Re: ubifs became broken on contigous power-fails
Date: Wed, 12 May 2010 13:30:07 +0600
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
In-Reply-To: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
MIME-Version: 1.0
Message-ID: <201005121330.07802.pazdnikov@prosoft.ural.ru>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Reply-To: pazdnikov@prosoftsystems.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

recovery proccess of ubi2:dbfs prints

ubifs_rcvry_gc_commit: could not find a dirty LEB

but we have plenty of free space

# df
Filesystem                Size      Used Available Use% Mounted on
ubi0:rootfs              13.2M      7.5M      5.7M  57% /
tmpfs                     4.0K         0      4.0K   0% /dev
shm                       1.0M         0      1.0M   0% /dev/shm
tmpfs                     1.0M      8.0K   1016.0K   1% /tmp
tmpfs                     1.0M      4.0K   1020.0K   0% /root
ubi1:logs                11.5M    908.0K     10.0M   8% /var/log
ubi1:tmp                 13.4M     16.0K     12.7M   0% /usr/local/ecom/tmp
ubi0:local                2.1M     64.0K      1.9M   3% /var/local
ubi:config                2.0M     68.0K      1.9M   3% /usr/local/ecom/conf
ubi2:dbfs               169.1M     36.0M    128.4M  22% /usr/local/ecom/db


ubifs/recovery.c: 1044

int ubifs_rcvry_gc_commit(struct ubifs_info *c)
{
	...

	err = ubifs_find_dirty_leb(c, &lp, wbuf->offs, 2);
	if (err) {
		if (err == -ENOSPC)
			dbg_err("could not find a dirty LEB");
		return err;
	}
	ubifs_assert(!(lp.flags & LPROPS_INDEX));
	lnum = lp.lnum;

Why <ubifs_find_dirty_leb> returns -ENOSPC ? we have enough of free space 
according to <df> report

--
Best regards,
Sasha
