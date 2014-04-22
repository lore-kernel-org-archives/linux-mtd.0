Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcUtt-0006jR-9i
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 07:13:54 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: David Yat Sin <jd.yatsin@gmail.com>
Subject: RE: Estimating flash life by reading EC (Erase Counters)
Date: Tue, 22 Apr 2014 07:13:14 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3D37F1@post.tritech.se>
References: <CAMPHVD9=1icuuuXybU2qCyc6n9ZzF2igpr1HFjBU_RUHEaADPw@mail.gmail.com>,
 <CAFLxGvy0d_xDe8c-1CjRz1VxSz02_hQVJ8FK-Qadq0JVs-eryg@mail.gmail.com>
In-Reply-To: <CAFLxGvy0d_xDe8c-1CjRz1VxSz02_hQVJ8FK-Qadq0JVs-eryg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, April 21, 2014 10:48 PM, Richard Weinberger wrote:=0A=
> On Mon, Apr 21, 2014 at 9:41 PM, David Yat Sin <jd.yatsin@gmail.com> wrot=
e:=0A=
>> Hi,=0A=
>> My goal is to be able to estimate the flash drive life in a production=
=0A=
>> environment, so if there is a better/easier way of achieving this,=0A=
>> please let me know.=0A=
>>=0A=
>> I have a small embedded device using NAND than runs UBIFS for the user=
=0A=
>> partition. Our application constantly writes to log files, the log=0A=
>> files are appended and gzip'ed, so it is hard to determine how much=0A=
>> data is actually written to disk.=0A=
>>=0A=
>> I am hoping to do this by:=0A=
>>=0A=
>> 1. Read the EC (Erase Count) headers for each page on the partition=0A=
>> 2. Let my system run for several days/weeks/months=0A=
>> 3. Read the EC headers again=0A=
>> 4. Then extrapolate drive life expectancy by comparing number of erase=
=0A=
>> counts with the NAND endurance.=0A=
>>=0A=
>> Is there a utility that I could use to read the Erase Counters on a=0A=
>> UBIFS partition?=0A=
>=0A=
>IIRC ubinfo can tell you the value of the highest EC.=0A=
=0A=
Same value can be found using:=0A=
=0A=
cat /sys/class/ubi/ubi0/max_ec=0A=
=0A=
As you probably know, both max and mean value can be found in the kernel me=
ssage log after a reboot, e.g.:=0A=
=0A=
UBI: max/mean erase counter: 10/7=0A=
=0A=
BR // Mats=0A=
