Received: from mail-bw0-f211.google.com ([209.85.218.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVKjF-0003Eq-Hd
	for linux-mtd@lists.infradead.org; Mon, 27 Jul 2009 07:34:41 +0000
Received: by bwz7 with SMTP id 7so2404383bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jul 2009 00:34:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090726230715.GD17272@mit.edu>
References: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
	<20090726230715.GD17272@mit.edu>
Date: Mon, 27 Jul 2009 09:34:35 +0200
Message-ID: <71cd59b00907270034r6886bd6cxab080e29e3ec3674@mail.gmail.com>
Subject: Re: [PATCH 0/2] RFC: Add support for UBI and UBIFS
From: Corentin Chary <corentin.chary@gmail.com>
To: Theodore Tso <tytso@mit.edu>
Content-Type: multipart/mixed; boundary=0016e659fbf051986b046faafcd7
Cc: dedekind@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016e659fbf051986b046faafcd7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2009 at 1:07 AM, Theodore Tso<tytso@mit.edu> wrote:
> On Wed, Jul 15, 2009 at 11:38:42AM +0200, Corentin Chary wrote:
>> Hi,
>> Here is two patch to add support for UBI and UBIFS in libblkid
>> With that, if you type "blkid" it will show you UBIFS filesystem.
>>
>> The thing is that I'm not sure this patch is really usefull as UBIFS
>> is a "nodev" filesystem, and it doesn't deal with block devices.
>>
>> I first started theses patch to be able to do stuff like:
>> mount /dev/ubi0_0 /mnt/test but we need to patch UBIFS for that.
>>
>> So, do you think we should be able to do that ? If it's ok, these
>> two patch are a first step.
>
> Sorry for the delay in getting back to you; things have been pretty
> busy this past week or two. =A0Can you get me small (preferably under
> 200k) sample filesystem images for the purposes of regression testing?

No problem. Here is a sample image with the default filesystem.
Maybe Artem can provide more interesting image for regression testing.

> Also, the blkid library is in the process of being transferred to
> util-linux-ng. =A0So I'm willing to apply the patches, but they also
> need to be ported to the version of the blkid library in util-linux-ng
> to make sure this feature doesn't get lost when distributions start
> transitioning to util-linux-ng.

Ok, I'll port the patch and send them to util-linux-ng ASAP.

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org

--0016e659fbf051986b046faafcd7
Content-Type: application/x-gzip; name="ubifs.img.gz"
Content-Disposition: attachment; filename="ubifs.img.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fxmvqng60

H4sICDRTbUoAA3ViaWZzLmltZwDt2ztrFGEUBuCzu9ndGBGXgBAwhhBQQVCyRSw0iEEtktbLD7D2
0lhoZ6OtphGxWi9YWEqsRRCL+AtCbK00oP6BOJ8zo2sS0YDJmvg8cDhz5sbAN0w1b3uo1Xh4/sqF
ShRaEY3oUs1qMmIw8oq5H7tTVYrqj3yjr5i/Gyn6/IPjt+bffri4cOr98/ansROHD9wLAAAAYFMs
AwAAAAAAAAAAAABbRnuo1Vhsfp6ulj8EZxvNrJ1c41/hWhQ538x4VgPlXM3nb87ldxqv5WNn5U0e
5a2e1aGip+tTn+g6rb+olCUeXN8vzaxDWv87iwcXa+WOX6x/Wgfrv/30+vsDAAAAAAAAAAAAAAAA
AKyW8p9vvrw687v8ZyL/uf2k9X/XerHcV+6Q//2v9Pr7AwAAAAAAAAAAAAAAAACslvKfc7NH7jaL
POBo5LnOUjq+a2FiupyHI89qvq5sXkaRjdPr9w8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
4F+1VI9r+/qO7YyRiN0x04rrEZOx1nR7fyVu1qI5GrHncbXTbKYjvX58AAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC2ufZQqzGw9+loX+TGs9qRVaXoSaeYk3T+7I2B
sWKM4azqWc2VJ7Cl9Pr9AwAAAAAAAAAAAAAAAADgZynP+/Lj/alGkQftFH1lnLe+4vizs5dn1urd
ql3bS1Or7/kn0vMdvXrpSTmXeePT8sZ/Ra/fPwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA2xleFJG8KADgE
AA==
--0016e659fbf051986b046faafcd7--
