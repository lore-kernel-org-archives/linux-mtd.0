Received: from mail.brecis.com ([64.168.228.202])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Yubw-0004PX-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 20:58:09 +0000
Received: from solar.brecis.com (mailhost [64.168.228.209])
	by mail.brecis.com (8.9.3+Sun/8.9.3) with ESMTP id NAA06570
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 13:25:25 -0800 (PST)
Received: from scorpio.brecis.com (scorpio [172.18.10.34])
	by solar.brecis.com (8.11.6+Sun/8.11.6) with ESMTP id h0FLSr901934
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 13:28:53 -0800 (PST)
Received: (from swahl@localhost)
	by scorpio.brecis.com (8.9.1b+Sun/8.9.1) id NAA11220
	for linux-mtd@lists.infradead.org; Wed, 15 Jan 2003 13:27:06 -0800 (PST)
Date: Wed, 15 Jan 2003 15:28:29 -0600
From: Steve Wahl <swahl@brecis.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: About flash chip writing/erasing, reading chip status.
Message-ID: <20030115152829.T1589@brecis.com>
References: <20030115113705.P1589@brecis.com> <20030115151745.R1589@brecis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20030115151745.R1589@brecis.com>; from swahl@brecis.com on Wed, Jan 15, 2003 at 03:17:45PM -0600
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

On Wed, Jan 15, 2003 at 03:17:45PM -0600, Steve Wahl wrote:
> 
> Like the comment says, this depends on being able to get CMD(1<<5) by
> doing a left shift of CMD(1<<6).
          ^^^^
AARGHHH....

For those who know their directions, I meant a RIGHT shift...  Sorry.

--> Steve Wahl,  Brecis Communications
