Received: from smtp-out-6.wanadoo.fr ([193.252.19.25] helo=mel-rto6.wanadoo.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17msWC-0003dp-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2002 10:01:40 +0100
Received: from mel-rta8.wanadoo.fr (193.252.19.79) by mel-rto6.wanadoo.fr (6.5.007)
        id 3D760C2500098506 for linux-mtd@lists.infradead.org; Thu, 5 Sep 2002 11:01:10 +0200
Received: from isis (80.14.45.66) by mel-rta8.wanadoo.fr (6.5.007)
        id 3D76090F0007840E for linux-mtd@lists.infradead.org; Thu, 5 Sep 2002 11:01:10 +0200
From: "Thomas TESTASECCA" <thomas.testasecca@etictelecom.com>
To: "Mtd" <linux-mtd@lists.infradead.org>
Subject: Scheduler, or task priority problem ... i need help
Date: Thu, 5 Sep 2002 11:00:18 +0200
Message-ID: <AEEFILJDOOHJLBCFOBJDIEIJDAAA.thomas.testasecca@etictelecom.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

 Hi all,
I works on our design which is similar to the cdb89712 dev board ( ep7311,
1x16bits*4Mo strataflash ...)

I works with arm-linux-2.4.18-rmk7.

This is my problem :

I' ve got a periodic task which feeds the watchdog every 2 seconds, let's us
call it the WD task.

It's a shell script which looks like that :

while true; do

    echo 3000 > /proc/WD # i feed the Watch Dog

    sleep 2

done

Ok, it works fine most of the time.

I also have an ftp server running (pure-ftpd), with the "ftp" directory into
a jffs2.

When i upload (by ftp) a file into the jffs2 (for a 200kByte file it takes
approx 40s) during the upload time the pure-ftpd process really loads the
system, and my WD task, doesn't run anymore until the end of the upload.

It looks like the ftpd proccess had a higher priority than the WD process,
or it is the scheduler that doesn't do his job.

So i've tried to run "nice" on the two process, with max priority for WD
task, and min prio for ftp : the result is a little better : the WD process
runs approx every 15-20s during the upload ( instead of 2seconds !!! ).


I think it may come from MTD/JFFS2 that doesn't give the hand back to the
kernel.

But that's not satisfactory !! i want the WD fed, when i want !!

Does anyone has experienced the same kind of problem ?

Any idea will be really appreciate ...

Thanks

Thomas
