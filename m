Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELJyx-0001bE-Cw
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 08:27:37 -0400
Message-ID: <433D2F06.6050003@cetrtapot.si>
Date: Fri, 30 Sep 2005 14:26:46 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si>
	<20050928100031.GA18192@wohnheim.fh-wedel.de>
In-Reply-To: <20050928100031.GA18192@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed; boundary="------------060002040003010206090708"
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060002040003010206090708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Jörn Engel wrote:
> On Wed, 28 September 2005 11:36:13 +0200, hinko.kocevar@cetrtapot.si wrote:
> 
>>On new setup - using yesterdays MTD CVS and 2.6.12 kernel with EBS enabled:
>>Mounting flash4 clean partition	[1]
>>real    0m 3.75s
>>user    0m 0.02s
>>sys     0m 1.17s
>>-- -- -- -- -- -- -- -- -- --
>>Mounting flash4 dirty partition	[2]
>>real    0m 0.75s
>>user    0m 0.02s
>>sys     0m 0.73s
> 

Here are more tests from our system. Setup is the same as before:
system1: 2.6.11, April MTD, no EBS
system2: 2.6.12, Latest CVS, EBS

I haven't looked at the system2 clean/dirty mount times much closer, but 
  It appears that dirty partition is mounted faster evrytime - hence 
several iterarions of the test.

I also added my testing script...

regards,
hinko

--------------060002040003010206090708
Content-Type: text/plain;
 name="test_flash_2.6.11-CP_V3_08242005"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="test_flash_2.6.11-CP_V3_08242005"

FLASH test v1.0     START @ Thu Sep 29 18:21:59 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 2.20s
user	0m 0.03s
sys	0m 0.55s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.28s
user	0m 0.01s
sys	0m 5.24s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.70s
user	0m 0.02s
sys	0m 1.62s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.40s
user	0m 0.01s
sys	0m 17.34s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.24s
user	0m 0.02s
sys	0m 2.17s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.29s
user	0m 0.03s
sys	0m 23.15s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 18:53:14 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 18:53:15 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.58s
user	0m 0.02s
sys	0m 0.56s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.49s
user	0m 0.02s
sys	0m 5.44s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.75s
user	0m 0.02s
sys	0m 1.63s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.52s
user	0m 0.01s
sys	0m 17.45s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.20s
user	0m 0.03s
sys	0m 2.15s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.13s
user	0m 0.01s
sys	0m 23.02s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 19:24:11 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 19:24:11 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.59s
user	0m 0.01s
sys	0m 0.57s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.37s
user	0m 0.03s
sys	0m 5.32s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.73s
user	0m 0.01s
sys	0m 1.63s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.47s
user	0m 0.02s
sys	0m 17.37s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.24s
user	0m 0.03s
sys	0m 2.15s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.25s
user	0m 0.03s
sys	0m 23.13s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 19:54:47 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 19:54:48 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.58s
user	0m 0.01s
sys	0m 0.57s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.52s
user	0m 0.01s
sys	0m 5.49s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.77s
user	0m 0.01s
sys	0m 1.63s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.29s
user	0m 0.02s
sys	0m 17.20s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.13s
user	0m 0.02s
sys	0m 2.15s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.14s
user	0m 0.01s
sys	0m 23.03s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 20:25:24 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 20:25:25 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.58s
user	0m 0.03s
sys	0m 0.54s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.19s
user	0m 0.03s
sys	0m 5.15s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.69s
user	0m 0.04s
sys	0m 1.61s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.42s
user	0m 0.01s
sys	0m 17.34s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.98s
user	0m 0.01s
sys	0m 2.16s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.13s
user	0m 0.01s
sys	0m 23.04s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 20:55:58 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 20:55:58 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.58s
user	0m 0.02s
sys	0m 0.56s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.41s
user	0m 0.03s
sys	0m 5.36s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.71s
user	0m 0.02s
sys	0m 1.63s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.43s
user	0m 0.01s
sys	0m 17.36s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.22s
user	0m 0.02s
sys	0m 2.15s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.17s
user	0m 0.02s
sys	0m 23.05s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 21:26:39 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 21:26:39 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.58s
user	0m 0.01s
sys	0m 0.57s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.12s
user	0m 0.03s
sys	0m 5.08s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.71s
user	0m 0.01s
sys	0m 1.63s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.33s
user	0m 0.02s
sys	0m 17.22s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.21s
user	0m 0.02s
sys	0m 2.17s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.18s
user	0m 0.03s
sys	0m 23.08s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 21:57:22 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 21:57:23 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.58s
user	0m 0.02s
sys	0m 0.56s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.26s
user	0m 0.02s
sys	0m 5.21s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 3.26s
user	0m 0.02s
sys	0m 1.62s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.35s
user	0m 0.01s
sys	0m 17.26s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.23s
user	0m 0.02s
sys	0m 2.17s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.21s
user	0m 0.03s
sys	0m 23.07s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 22:28:18 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 22:28:19 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.58s
user	0m 0.01s
sys	0m 0.57s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.25s
user	0m 0.01s
sys	0m 5.22s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.74s
user	0m 0.01s
sys	0m 1.66s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.21s
user	0m 0.02s
sys	0m 17.13s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.24s
user	0m 0.01s
sys	0m 2.18s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.13s
user	0m 0.01s
sys	0m 23.00s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 22:59:27 UTC 2005
FLASH test v1.0     START @ Thu Sep 29 22:59:27 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 2.20s
user	0m 0.02s
sys	0m 0.56s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 5.44s
user	0m 0.03s
sys	0m 5.38s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 1.76s
user	0m 0.02s
sys	0m 1.65s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 17.41s
user	0m 0.03s
sys	0m 17.28s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.19s
user	0m 0.01s
sys	0m 2.17s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 23.15s
user	0m 0.01s
sys	0m 23.04s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Thu Sep 29 23:30:24 UTC 2005

--------------060002040003010206090708
Content-Type: text/plain;
 name="test_flash_2.6.12"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="test_flash_2.6.12"

FLASH test v1.0     START @ Fri Sep 30 01:23:39 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.75s
user	0m 0.02s
sys	0m 0.73s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.49s
user	0m 0.02s
sys	0m 0.48s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 2.23s
user	0m 0.02s
sys	0m 2.16s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.44s
user	0m 0.01s
sys	0m 1.42s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.25s
user	0m 0.02s
sys	0m 2.85s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.90s
user	0m 0.03s
sys	0m 1.86s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 01:53:43 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 01:53:43 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.77s
user	0m 0.03s
sys	0m 0.74s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.48s
user	0m 0.02s
sys	0m 0.47s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 2.22s
user	0m 0.01s
sys	0m 2.16s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.50s
user	0m 0.02s
sys	0m 1.47s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.89s
user	0m 0.02s
sys	0m 2.86s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.85s
user	0m 0.01s
sys	0m 1.85s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 02:24:17 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 02:24:18 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 2.15s
user	0m 0.02s
sys	0m 0.73s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.49s
user	0m 0.02s
sys	0m 0.47s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 3.18s
user	0m 0.02s
sys	0m 2.13s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.45s
user	0m 0.02s
sys	0m 1.42s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.18s
user	0m 0.02s
sys	0m 2.86s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.85s
user	0m 0.02s
sys	0m 1.82s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 02:55:11 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 02:55:11 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 2.15s
user	0m 0.02s
sys	0m 0.73s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.50s
user	0m 0.01s
sys	0m 0.49s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 3.32s
user	0m 0.02s
sys	0m 2.14s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.52s
user	0m 0.01s
sys	0m 1.50s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.92s
user	0m 0.01s
sys	0m 2.84s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 2.02s
user	0m 0.02s
sys	0m 2.00s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 03:25:28 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 03:25:29 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.75s
user	0m 0.01s
sys	0m 0.74s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.51s
user	0m 0.02s
sys	0m 0.49s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 2.21s
user	0m 0.01s
sys	0m 2.14s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.43s
user	0m 0.01s
sys	0m 1.42s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.22s
user	0m 0.03s
sys	0m 2.84s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.87s
user	0m 0.02s
sys	0m 1.83s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 03:55:30 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 03:55:31 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.76s
user	0m 0.02s
sys	0m 0.74s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.48s
user	0m 0.02s
sys	0m 0.46s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 3.33s
user	0m 0.02s
sys	0m 2.14s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.44s
user	0m 0.02s
sys	0m 1.41s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 2.92s
user	0m 0.01s
sys	0m 2.85s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.88s
user	0m 0.03s
sys	0m 1.84s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 04:27:05 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 04:27:06 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.76s
user	0m 0.01s
sys	0m 0.74s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.49s
user	0m 0.02s
sys	0m 0.48s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 3.29s
user	0m 0.04s
sys	0m 2.12s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.43s
user	0m 0.01s
sys	0m 1.42s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.27s
user	0m 0.02s
sys	0m 2.87s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.89s
user	0m 0.01s
sys	0m 1.88s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 04:57:26 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 04:57:26 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.75s
user	0m 0.03s
sys	0m 0.72s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.49s
user	0m 0.01s
sys	0m 0.48s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 3.20s
user	0m 0.01s
sys	0m 2.15s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.44s
user	0m 0.02s
sys	0m 1.40s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.22s
user	0m 0.03s
sys	0m 2.84s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.91s
user	0m 0.02s
sys	0m 1.87s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 05:27:40 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 05:27:40 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.76s
user	0m 0.02s
sys	0m 0.73s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.49s
user	0m 0.02s
sys	0m 0.47s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 2.21s
user	0m 0.02s
sys	0m 2.14s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.42s
user	0m 0.02s
sys	0m 1.39s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.16s
user	0m 0.02s
sys	0m 2.85s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.88s
user	0m 0.02s
sys	0m 1.84s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 05:58:35 UTC 2005
FLASH test v1.0     START @ Fri Sep 30 05:58:36 UTC 2005
Nakljucno dodajanje datotek, brisanje datotek
Mounting flash4 clean partition
real	0m 0.75s
user	0m 0.02s
sys	0m 0.74s
-- -- -- -- -- -- -- -- -- --
Mounting flash4 dirty partition
real	0m 0.52s
user	0m 0.01s
sys	0m 0.51s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 clean partition
real	0m 2.19s
user	0m 0.01s
sys	0m 2.15s
-- -- -- -- -- -- -- -- -- --
Mounting flash5 dirty partition
real	0m 1.45s
user	0m 0.02s
sys	0m 1.41s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 clean partition
real	0m 3.25s
user	0m 0.02s
sys	0m 2.87s
-- -- -- -- -- -- -- -- -- --
Mounting flash6 dirty partition
real	0m 1.95s
user	0m 0.02s
sys	0m 1.92s
-- -- -- -- -- -- -- -- -- --
FLASH test END @ Fri Sep 30 06:29:16 UTC 2005

--------------060002040003010206090708
Content-Type: application/x-shellscript;
 name="test_flash.sh"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="test_flash.sh"

IyEvYmluL3NoCgpURVNURjA9L3RtcC90ZXN0ZjAKVEVTVEYxPS90bXAvdGVzdGYxClRFU1RG
Mj0vdG1wL3Rlc3RmMgpURVNURjM9L3RtcC90ZXN0ZjMKCnRlc3RfZ2VuZXJhdGVfY29udGVu
dCAoKQp7Cgl0b3VjaCAkVEVTVEYwCglkZCBpZj0vZGV2L3VyYW5kb20gb2Y9JFRFU1RGMCBj
b3VudD0zMCAyPjEKCXRvdWNoICRURVNURjEKCWRkIGlmPS9kZXYvdXJhbmRvbSBvZj0kVEVT
VEYxIGNvdW50PTQwIDI+MQoJdG91Y2ggJFRFU1RGMgoJZGQgaWY9L2Rldi91cmFuZG9tIG9m
PSRURVNURjIgY291bnQ9NTAgMj4xCgl0b3VjaCAkVEVTVEYzCglkZCBpZj0vZGV2L3VyYW5k
b20gb2Y9JFRFU1RGMyBjb3VudD02MCAyPjEKfQoKdGVzdF9lcmFzZV9maWxlICgpCnsKCWxv
Y2FsIEZJTEVFWFQ9MDsKCXRlc3RfZ2VuZXJhdGVfcmFuZG9tICQyCglGSUxFRVhUPSQ/CgkK
CXdoaWxlIFsgISAtZSAkMS9mXyRGSUxFRVhUIF0KCWRvCgkJdGVzdF9nZW5lcmF0ZV9yYW5k
b20gJDIKCQlGSUxFRVhUPSQ/Cglkb25lCgoJZWNobwoJZWNobyAiRGVsZXRpbmcgJDEvZl8k
RklMRUVYVC4uLiIKCXJtICQxL2ZfJEZJTEVFWFQKfQoKdGVzdF9nZW5lcmF0ZV9yYW5kb20g
KCkKewoJIyB1cG9yYWJsamEgaW50ZXJubyAkUkFORE9NIHNwcmVtZW5saml2a28KCU1ZUkFO
RD0kUkFORE9NCglsZXQgIk1ZUkFORCAlPSAkMSIKIwllY2hvICRNWVJBTkQKCXJldHVybiAk
TVlSQU5ECn0KCnRlc3RfdW1vdW50X2ZsYXNoICgpCnsKCWVjaG8gIlVtb3VudGluZyAvZGV2
LyQxIC4uLiIKCXVtb3VudCAtZiAvZGV2LyQxCn0KCnRlc3RfY3JlYXRlX21vdW50X3BvaW50
cygpCnsKCWlmIFsgISAtZSAvdG1wLyQxIF07IHRoZW4KCQllY2hvICJDcmVhdGluZyBtb3Vu
dCBwb2ludCAvdG1wLyQxIC4uLiIKCQlta2RpciAvdG1wLyQxCglmaQp9Cgp0ZXN0X21vdW50
X2ZsYXNoKCkKewoJZWNobyAiTW91bnRpbmcgL2Rldi8kMSBvbiAvdG1wLyQxIC4uLiIKCWlm
IFsgJDIgLWVxIDEgXTsgdGhlbgoJCXRpbWUgbW91bnQgLXQgamZmczIgL2Rldi8kMSAvdG1w
LyQxIDI+PiAvdG1wL2xvZ2cKCQllY2hvICItLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAt
LSIgPj4gL3RtcC9sb2dnCgllbHNlCgkJbW91bnQgLXQgamZmczIgL2Rldi8kMSAvdG1wLyQx
CglmaQp9Cgp0ZXN0X2VyYXNlX2ZsYXNoKCkKewoJZWNobyAiRXJhc2luZyBmaWxlcyBvbiAv
ZGV2L2MkMSAuLi4iCgkvdXNyL3NiaW4vZmxhc2hfZXJhc2VhbGwgL2Rldi9jJDEKfQoKdGVz
dF9jcmVhdGVfZmlsZSgpCnsKCWlmIFsgISAtZSAkMSBdOyB0aGVuCiMJCWVjaG8gIkNyZWF0
aW5nIGZpbGUgJDEgLi4uIgoKCQl0b3VjaCAkMQoJCWRkIGlmPS9kZXYvdXJhbmRvbSBvZj0k
MSBjb3VudD0xMCAyPjEKCWZpCn0KCnRlc3RfYXBwZW5kX2ZpbGUoKQp7CiMJZWNobyAiQXBw
ZW5kaW5nIHRvIGZpbGUgJDEiCiMJVE1QRklMRTE9Ii90bXAvZmlsZWVleHh4MSIKCVRNUEZJ
TEUyPSIvdG1wL2ZpbGVlZXh4eDIiCgl0ZXN0X2dlbmVyYXRlX3JhbmRvbSA0CglURklMRT0k
PwoJaWYgWyAkVEZJTEUgLWVxIDAgXTt0aGVuCgkJY2F0ICQxICRURVNURjAgPj4gJFRNUEZJ
TEUyCgllbGlmIFsgJFRGSUxFIC1lcSAxIF07dGhlbiAKCQljYXQgJDEgJFRFU1RGMSA+PiAk
VE1QRklMRTIKCWVsaWYgWyAkVEZJTEUgLWVxIDIgXTt0aGVuIAoJCWNhdCAkMSAkVEVTVEYy
ID4+ICRUTVBGSUxFMgoJZWxpZiBbICRURklMRSAtZXEgMyBdO3RoZW4gCgkJY2F0ICQxICRU
RVNURjMgPj4gJFRNUEZJTEUyCglmaQoJbXYgJFRNUEZJTEUyICQxCgojCUlURVI9MAojCXdo
aWxlIFsgJElURVIgLWx0IDEwIF0KIwlkbwojCQllY2hvIC1uICIkSVRFUiAiCiMJCWRkIGlm
PS9kZXYvdXJhbmRvbSBvZj0kVE1QRklMRTEgY291bnQ9MTAgMj4xCiMJCWNhdCAkMSAkVE1Q
RklMRTEgPj4gJFRNUEZJTEUyCiMJCW12ICRUTVBGSUxFMiAkMQojCiMJCWxldCBJVEVSPUlU
RVIrMQojCWRvbmUKIwllY2hvICIiCn0KCgojIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKTkFORFM9ImZsYXNoNCBmbGFzaDUg
Zmxhc2g2IgoKZWNobyAiVGVzdCBTVEFSVC4iCmVjaG8gIkZMQVNIIHRlc3QgdjEuMCAgICAg
U1RBUlQgQCBgZGF0ZWAiID4+IC90bXAvbG9nZwplY2hvICJOYWtsanVjbm8gZG9kYWphbmpl
IGRhdG90ZWssIGJyaXNhbmplIGRhdG90ZWsiID4+IC90bXAvbG9nZwoKdGVzdF9nZW5lcmF0
ZV9jb250ZW50CgplY2hvICJNYWtpbmcgZW52aXJvbWVudCBzYW5lIC4uLiIKZm9yIE5BTkQg
aW4gJE5BTkRTCmRvCgl0ZXN0X3Vtb3VudF9mbGFzaCAkTkFORAoJdGVzdF9lcmFzZV9mbGFz
aCAkTkFORAoJdGVzdF9jcmVhdGVfbW91bnRfcG9pbnRzICROQU5ECmRvbmUKCmVjaG8gIk1v
dW50aW5nIGNsZWFuIHBhcnRpdGlvbiAuLi4iCmZvciBOQU5EIGluICROQU5EUwpkbwoJZWNo
byAiTW91bnRpbmcgJE5BTkQgY2xlYW4gcGFydGl0aW9uIiA+PiAvdG1wL2xvZ2cKCXRlc3Rf
bW91bnRfZmxhc2ggJE5BTkQgMQoKCWVjaG8gIkZpbGxpbmcgJE5BTkQgd2l0aCBmaWxlcyAu
Li4iCglDTlQ9MAoJTElNSVQ9MTUwCglpZiBbICROQU5EID0gImZsYXNoNSIgXTsgdGhlbgoJ
CUxJTUlUPTUwMAoJZWxpZiBbICROQU5EID0gImZsYXNoNiIgXTsgdGhlbgoJCUxJTUlUPTcw
MAoJZmkKCgllY2hvICIiCgl3aGlsZSBbICRDTlQgLWx0ICRMSU1JVCBdCglkbwoJCSMgZ2Vu
ZXJpcmFqIHJhbmRvbSBmaWxlCgkJdGVzdF9nZW5lcmF0ZV9yYW5kb20gJExJTUlUCgkJRklM
RT0kPwoKCQl0ZXN0X2NyZWF0ZV9maWxlIC90bXAvJE5BTkQvZl8kRklMRQoJCXRlc3RfYXBw
ZW5kX2ZpbGUgL3RtcC8kTkFORC9mXyRGSUxFCgoJCWVjaG8gLW5lICIgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXHIiCgkJZWNobyAtbmUg
IlskQ05UXSBBcHBlbmRpbmcgdG8gZmlsZSAvdG1wLyROQU5EL2ZfJEZJTEVcciIKCQlsZXQg
Q05UPUNOVCsxCgoJCWxldCAiRVJBU0U9JENOVCU1IgoJCWlmIFsgJEVSQVNFIC1lcSAwIF07
IHRoZW4KCQkJdGVzdF9lcmFzZV9maWxlCS90bXAvJE5BTkQgJExJTUlUCgkJZmkKCWRvbmUK
Cgl0ZXN0X3Vtb3VudF9mbGFzaCAkTkFORAoJZWNobyAiTW91bnRpbmcgJE5BTkQgZGlydHkg
cGFydGl0aW9uIiA+PiAvdG1wL2xvZ2cKCXRlc3RfbW91bnRfZmxhc2ggJE5BTkQgMQpkb25l
CgplY2hvICJUZXN0IEVORC4iCmVjaG8gIkZMQVNIIHRlc3QgRU5EIEAgYGRhdGVgIiA+PiAv
dG1wL2xvZ2cK
--------------060002040003010206090708--
