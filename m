Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzMq4-0000Or-4w
 for linux-mtd@lists.infradead.org; Tue, 03 Oct 2017 13:02:28 +0000
Received: by mail-oi0-x236.google.com with SMTP id j126so14090707oia.10
 for <linux-mtd@lists.infradead.org>; Tue, 03 Oct 2017 06:01:59 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Feignon <nicolas.feignon@mobile-devices.fr>
Date: Tue, 3 Oct 2017 15:01:58 +0200
Message-ID: <CAFadFHRqVe5SmQBZAaFHt2d6+GY5p1mbE9_G40AApfK29oHh8Q@mail.gmail.com>
Subject: Issue with encrypted filenames on UBIFS
To: linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm encountering an issue with filesystem encryption on UBIFS. I'm using Ke=
rnel
4.13.3.

The encryption of filenames does not work correctly for filenames of more t=
hat
16 characters. It works fine if the names are shorter. Here's what I get:

[~/writeDir]# touch aaaaaaaaaaaaaaaa # 16 characters
[~/writeDir]# ls
ls: cannot access aaaaaaaaaaaaaaaa>*0=D1=90L9: No such file or directory
aaaaaaaaaaaaaaaa?>??*0?????n??L9

I set the policy with:
[~]# openssl rand 64 > key
[~]# fscryptctl insert_key < key
a5bb6bff407f6f67
[~]# fscryptctl set_policy a5bb6bff407f6f67 writeDir/

I get the issue for all encryption modes and padding values altough the len=
gth
of filenames at which it doesn't work varies.
With the default padding of 32 and AES-256-CTS encryption mode, it does not
work for length >=3D 16 and <=3D 32, length >=3D 48 and <=3D 64...

I took a look at fs/crypto/fname.c but I can't figure out the problem. It s=
eems
like it's an overflow somewhere.


Best regards,
Nicolas
