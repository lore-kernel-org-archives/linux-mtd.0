Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrNzO-0007H2-4i
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 09:25:23 +0000
Message-ID: <546DB333.5080500@huawei.com>
Date: Thu, 20 Nov 2014 17:24:03 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v5 3/4] ubi-utils: ubidump: introduce ubidump
References: <544788DA.9090401@huawei.com> <54478A47.3080102@huawei.com>
 <1414657165.23185.10.camel@sauron.fi.intel.com>
 <1414657828.23185.16.camel@sauron.fi.intel.com> <5452F133.2030701@huawei.com>
 <1414740722.23185.63.camel@sauron.fi.intel.com> <54536AA8.3030403@huawei.com>
 <1414761646.23185.71.camel@sauron.fi.intel.com>
In-Reply-To: <1414761646.23185.71.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/10/31 21:20, Artem Bityutskiy wrote:
> On Fri, 2014-10-31 at 18:55 +0800, hujianyang wrote:
>> I should say it is unfair for me to discuss a problem like this with
>> you. I will follow your idea because I not good at English.
>>
>> Give me some days, I will resend this patch set. I'm happy to see the
>> patch set is thinner than it used to be. Thanks for your help.
> 
> Well, nothing unfair. I might be missing your point. All I want is to
> understand what will the options be, what will they mean. If you cannot
> come up with a short and concise description for the options, explain
> them in a long way in the e-mail, I'll help with the concise version.
> And you do not have t agree with me, I am just asking question so at
> this point. Do not worry about your English skills too much.
> 
> 
> 

Artem,

Sorry, I'm busy with other stuff these days so I have to leave *ubidump*
behind. I'd like to introduce this option to you and wish you could help
me come up with a suitable name.


This dump tool can print NODEs type only, like this:

/tmp# ./ubidump /dev/ubi0_0 --lnum 0
scan LEB 0:0
look at LEB 0:0 (126976 bytes left)
scanning superblock node at LEB 0:0
look at LEB 0:4096 (122880 bytes left)
hit empty space at LEB 0:4096
stop scanning LEB 0 at offset 126976

/tmp# ./ubidump /dev/ubi0_0 --lnum 1
scan LEB 1:0
look at LEB 1:0 (126976 bytes left)
scanning master node at LEB 1:0
look at LEB 1:512 (126464 bytes left)
scanning padding node at LEB 1:512
1508 bytes padded at LEB 1:512, offset now 2048
look at LEB 1:2048 (124928 bytes left)
scanning master node at LEB 1:2048
look at LEB 1:2560 (124416 bytes left)
scanning padding node at LEB 1:2560
1508 bytes padded at LEB 1:2560, offset now 4096
look at LEB 1:4096 (122880 bytes left)
scanning master node at LEB 1:4096
look at LEB 1:4608 (122368 bytes left)
scanning padding node at LEB 1:4608
1508 bytes padded at LEB 1:4608, offset now 6144
look at LEB 1:6144 (120832 bytes left)
scanning master node at LEB 1:6144
look at LEB 1:6656 (120320 bytes left)
scanning padding node at LEB 1:6656
1508 bytes padded at LEB 1:6656, offset now 8192
look at LEB 1:8192 (118784 bytes left)
hit empty space at LEB 1:8192
stop scanning LEB 1 at offset 126976


But it can do more, print data in NODEs with an additional option:

/tmp# ./ubidump /dev/ubi0_0 --lnum 0 --info(--ubifs As you suggested)
scan LEB 0:0
look at LEB 0:0 (126976 bytes left)
scanning superblock node at LEB 0:0
	magic          0x6101831
	crc            0x1144bca
	node_type      6 (superblock node)
	group_type     0 (no node group)
	sqnum          1
	len            4096
	key_hash       0 (R5)
	key_fmt        0 (simple)
	flags          0
	big_lpt        0
	space_fixup    0
	min_io_size    2048
	leb_size       126976
	leb_cnt        940
	max_leb_cnt    940
	max_bud_bytes  5459968
	log_lebs       4
	lpt_lebs       2
	orph_lebs      2
	jhead_cnt      1
	fanout         8
	lsave_cnt      256
	default_compr  1
	rp_size        5242880
	rp_uid         0
	rp_gid         0
	fmt_version    4
	time_gran      1000000000
	UUID           0x175248cUB
look at LEB 0:4096 (122880 bytes left)
hit empty space at LEB 0:4096
stop scanning LEB 0 at offset 126976


Do you have a good idea about how we call this option?


By the way, I've replied the mail

"UBIFS assert failed in ubifs_set_page_dirty at 1421"

reported by jijiagang@hisilicon.com but mm people do not response.

http://lists.infradead.org/pipermail/linux-mtd/2014-November/056378.html

I will change some mm code and test if it works, do you have any
suggestions about this?


Thanks~!

Hu
