Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PvICx-00043m-K8
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2011 23:45:24 +0000
Message-ID: <4D70280E.8030501@lambsys.com>
Date: Thu, 03 Mar 2011 17:45:18 -0600
From: David Lambert <dave@lambsys.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Bug in mtd_speedtest?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think I may have found an overflow condition in the speed calculation 
of mtd_speedtest on some platforms with larger flash partitions:

Consider for example if goodebcnt = 15000, and mtd->erasesize = 
256*1024, then there is an intermediate product of  3932160000 which 
results in the sign bit being set on a 32 bit integer. Maybe k should be 
an unsigned long long?

.....
static long calc_speed(void)
{
     long ms, k, speed;

     ms = (finish.tv_sec - start.tv_sec) * 1000 +
          (finish.tv_usec - start.tv_usec) / 1000;
     k = goodebcnt * mtd->erasesize / 1024;
     speed = (k * 1000) / ms;
     return speed;
}
.....
