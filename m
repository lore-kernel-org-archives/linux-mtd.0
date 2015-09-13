Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZazAT-0000H7-Qa
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2015 04:45:34 +0000
Received: by pacfv12 with SMTP id fv12so113579676pac.2
 for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2015 21:45:12 -0700 (PDT)
From: Bhuvanchandra <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>,
 Bhuvanchandra <bhuvanchandradv@gmail.com>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
 <55ADE35F.6050808@nod.at> <55AF41DD.2060902@gmail.com>
 <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55F2528D.9050506@gmail.com> <55F3F2BE.8090207@nod.at>
Cc: linux-mtd@lists.infradead.org, Stefan Agner <stefan@agner.ch>
Message-ID: <55F4FF56.7000107@gmail.com>
Date: Sun, 13 Sep 2015 10:15:10 +0530
MIME-Version: 1.0
In-Reply-To: <55F3F2BE.8090207@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/12/2015 03:09 PM, Richard Weinberger wrote:

> Hi!
>
> Am 11.09.2015 um 06:03 schrieb Bhuvanchandra:
>>> Running mkvol_bad /dev/ubi0
>>> [   99.630756] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [   99.637579] Volume creation request dump:
>>> [   99.641987]  vol_id    -2
>>> [   99.644784]  alignment 1
>>> [   99.647466]  bytes     124690432
>>> [   99.650994]  vol_type  3
>>> [   99.653696]  name_len  22
>>> [   99.656464]  1st 16 characters of name: mkvol_bad:test_m
>>> [   99.669464] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [   99.676292] Volume creation request dump:
>>> [   99.680674]  vol_id    128
>>> [   99.683558]  alignment 1
>>> [   99.686240]  bytes     124690432
>>> [   99.694911]  vol_type  3
>>> [   99.702852]  name_len  22
>>> [   99.710786]  1st 16 characters of name: mkvol_bad:test_m
>>> [   99.728668] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [   99.740962] Volume creation request dump:
>>> [   99.750630]  vol_id    0
>>> [   99.758537]  alignment 0
>>> [   99.766352]  bytes     124690432
>>> [   99.774804]  vol_type  3
>>> [   99.782409]  name_len  22
>>> [   99.789923]  1st 16 characters of name: mkvol_bad:test_m
>>> [   99.808480] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [   99.820028] Volume creation request dump:
>>> [   99.828796]  vol_id    0
>>> [   99.835879]  alignment -1
>>> [   99.842859]  bytes     124690432
>>> [   99.850335]  vol_type  3
>>> [   99.856849]  name_len  22
>>> [   99.863395]  1st 16 characters of name: mkvol_bad:test_m
>>> [   99.880157] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [   99.891064] Volume creation request dump:
>>> [   99.899440]  vol_id    0
>>> [   99.906182]  alignment 126977
>>> [   99.913456]  bytes     124690432
>>> [   99.920926]  vol_type  3
>>> [   99.927467]  name_len  22
>>> [   99.934058]  1st 16 characters of name: mkvol_bad:test_m
>>> [   99.950732] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [   99.961655] Volume creation request dump:
>>> [   99.970057]  vol_id    0
>>> [   99.976826]  alignment 2049
>>> [   99.983931]  bytes     124690432
>>> [   99.991412]  vol_type  3
>>> [   99.997959]  name_len  22
>>> [  100.004551]  1st 16 characters of name: mkvol_bad:test_m
>>> [  100.021254] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [  100.032201] Volume creation request dump:
>>> [  100.040649]  vol_id    0
>>> [  100.047441]  alignment 1
>>> [  100.054334]  bytes     -1
>>> [  100.061191]  vol_type  3
>>> [  100.067708]  name_len  22
>>> [  100.074250]  1st 16 characters of name: mkvol_bad:test_m
>>> [  100.090929] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [  100.101834] Volume creation request dump:
>>> [  100.110223]  vol_id    0
>>> [  100.116969]  alignment 1
>>> [  100.123783]  bytes     0
>>> [  100.130505]  vol_type  3
>>> [  100.136980]  name_len  22
>>> [  100.143502]  1st 16 characters of name: mkvol_bad:test_m
>>> [  100.160274] ubi0 error: ubi_create_volume: not enough PEBs, only 982 available
>>> [  100.175970] ubi0 error: ubi_create_volume: cannot create volume 0, error -28
>>> [  100.189501] ubi0 error: ubi_create_volume: not enough PEBs, only 982 available
>>> [  100.205998] ubi0 error: ubi_create_volume: cannot create volume 0, error -28
>>> [  100.222091] ubi0 error: verify_mkvol_req: bad volume creation request
>>> [  100.233529] Volume creation request dump:
>>> [  100.242409]  vol_id    0
>>> [  100.249771]  alignment 1
>>> [  100.256993]  bytes     126976
>>> [  100.264716]  vol_type  7
>>> [  100.272035]  name_len  22
>>> [  100.279316]  1st 16 characters of name: mkvol_bad:test_m
>>> [  100.416661] ubi0 error: ubi_create_volume: volume 0 already exists
>>> [  100.427776] ubi0 error: ubi_create_volume: cannot create volume 0, error -17
>>> [  100.441410] ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
>>> [  100.459295] ubi0 error: ubi_create_volume: cannot create volume 1, error -17
>>> [  100.711027] ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
>>> [  100.729733] ubi0 error: ubi_create_volume: cannot create volume 1, error -17
>>> [  131.225291] ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
>>> [  131.244295] ubi0 error: ubi_open_volume: cannot open device 0, volume -1, error -22
>>> [  131.269510] ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
>>> [  131.290092] ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
>>> [  131.551660] ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
>> With the recent fixes by Stefan to vf610_nfc driver the io_paral test passed, but the
>> above error's with the volume creation are still reproducible. Are these erros need to
>> be taken into consideration ?
> No. These logs are fine. mkvol_bad does negative testing.

Thanks! for the confirmation.

Best regards,
Bhuvan

>
> Thanks,
> //richard
