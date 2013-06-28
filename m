Received: from srv1.bluewind.it ([216.38.51.188])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsYqs-0005Q3-2J
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 13:36:38 +0000
Received: from smtp.bluewind.it ([80.86.152.212]:44771 helo=[192.168.0.42])
 by srv1.bluewind.it with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.80.1) (envelope-from <enrico.benetti@bluewind.it>)
 id 1UsYqX-0000NS-1n
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 15:36:17 +0200
Message-ID: <51CD9168.7000902@bluewind.it>
Date: Fri, 28 Jun 2013 15:36:40 +0200
From: enrico benetti <enrico.benetti@bluewind.it>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS: power cut test on 2.6.35 + NOR
References: <51CBDF47.709@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>,
 <51CC3669.103@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA8354@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCA8354@post.tritech.se>
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


>> I'm going to merge from 2.6.35 back-port repo and I'll let you know.
>>
Hi All,
I've merged down all 2.6.35 git repo patches and started again power cut
tests with integck.

After a whirl, I had an unrecoverable error during volume mount:

[   18.060413] UBI: attaching mtd7 to ubi0
[   18.064335] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[   18.070608] UBI: logical eraseblock size:    130944 bytes
[   18.076025] UBI: smallest flash I/O unit:    1
[   18.080472] UBI: VID header offset:          64 (aligned 64)
[   18.086145] UBI: data offset:                128
[   18.121404] UBI: attached mtd7 to ubi0
[   18.125167] UBI: MTD device name:            "wfs"
[   18.129962] UBI: MTD device size:            10 MiB
[   18.137534] UBI: number of good PEBs:        80
[   18.142129] UBI: number of bad PEBs:         0
[   18.146576] UBI: max. allowed volumes:       128
[   18.151196] UBI: wear-leveling threshold:    4096
[   18.155916] UBI: number of internal volumes: 1
[   18.160362] UBI: number of user volumes:     1
[   18.164818] UBI: available PEBs:             0
[   18.169264] UBI: total number of reserved PEBs: 80
[   18.174071] UBI: number of PEBs reserved for bad PEB handling: 0
[   18.180083] UBI: max/mean erase counter: 527/487
[   18.184741] UBI: image sequence number: 0
[   18.188766] UBI: background thread "ubi_bgt0d" started, PID 1219
UBI device number 0, total 80 LEBs (10475520 bytes, 10.0 MiB), available
0 LEBs (0 bytes), LEB size 130944 bytes (127.9 KiB)
[   20.391279] MTD do_write_buffer(): software timeout
[   20.452081] UBI error: nor_erase_prepare: cannot invalidate PEB 25,
write returned -5 read returned 2

Digging the web, I've found several discussions on write-timeout with
NOR devices (cfr.http://lists.infradead.org/pipermail/linux-mtd/2013-June/047177.html),
but this seems not to be the root cause.

Disabling background thread I was still not able to mount the volume,
but this patch (http://git.infradead.org/ubifs-2.6.git/commit/6fb4374f6b1b3932f3acfe9d353568d3d8599cad)
solved and at least mounting is ok.

As soon as write operations are performed on the filesystem again
there's a failure: it seems sector erasure is not properly
handled/requested.

Flash dump shows PEB 25 this way (= partially erased), so it turns out write operation can't work:

------------------------------------------------------------
00320040  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
*
003201e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
|................|
*
00320220  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
*
003203e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
|................|
*
00320820  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
*
------------------------------------------------------------

Please note that I'm using a 'slow' device (M29EW), with a maximum
sector erasure time of 4 secs, and this seems to stress asynchronous
operations with ubifs and integck test.

I'll go on with commit log analysis to check if this kind of issue is
already solved/discussed.

Full partition erasure has solved mount/fs issue, as expected.

Regards,
E
