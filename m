Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kd3PA-0001i0-VI
	for linux-mtd@lists.infradead.org; Tue, 09 Sep 2008 13:37:18 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kd3P3-00058C-Nx
	for linux-mtd@lists.infradead.org; Tue, 09 Sep 2008 13:37:10 +0000
Received: from gw-c.sigma-chemnitz.de ([62.153.82.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2008 13:37:09 +0000
Received: from enrico.scholz by gw-c.sigma-chemnitz.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2008 13:37:09 +0000
To: linux-mtd@lists.infradead.org
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 1/6] [MTD-UTILS] nandwrite: Qualifier Clean-up
Date: Tue, 09 Sep 2008 15:23:15 +0200
Message-ID: <lybpyxa1x8.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1220847899-22189-1-git-send-email-gerickson@nuovations.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Grant Erickson <gerickson@nuovations.com> writes:

> +static const char	*mtd_device, *img;

would it be possible to split this into two declarations?  I
really don't know if 'img' points to a constant or non-constant
char...


> -int main(int argc, char **argv)
> +int main(int argc, char * const argv[])

Is this really correct?  C standard mentions only

               int main(void) { /* ... */ }
               int main(int argc, char *argv[]) { /* ... */ }

as program entry points.  I suggest to cast 'argv' to a corresponding
data type when it is used.


Enrico
