Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0MWW-0007Vi-61
 for linux-mtd@lists.infradead.org; Thu, 13 Sep 2018 07:58:50 +0000
Received: by mail-ed1-x544.google.com with SMTP id u1-v6so3883429eds.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Sep 2018 00:58:37 -0700 (PDT)
To: linux-mtd@lists.infradead.org
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: Koen Vandeputte <koen.vandeputte@ncentric.com>
Subject: ubifs: regression since "ubifs: xattr: Don't operate on deleted
 inodes"
Message-ID: <fd473abd-58d2-076f-675a-fb1ac06aa984@ncentric.com>
Date: Thu, 13 Sep 2018 09:58:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm currently in the process of updating the kernel version within 
OpenWrt. (4.14.68 to 4.14.69)

Testing shows some issues on devices using specifically UBIFS.
Altering a perfect valid writable file shows weird errors:


[ Node 2 | node-2 ] ls -l /root/custom/scripts/banner.sh
-rwxr-xr-x    1 root     root           283 Sep 11 09:52 
/root/custom/scripts/banner.sh

[ Node 2 | node-2 ] cat /root/custom/scripts/banner.sh
#!/bin/sh

if [ ! -f /root/.banner_ok ]
then
     RELEASE=$(cat /root/build_date)
     VERSION=$(cat /root/version)

     echo "Generating banner: $VERSION $RELEASE"
     sed s/VERSION/$VERSION/g /root/custom/banner > /etc/banner
     sed -i s/RELEASE/$RELEASE/g /etc/banner

     touch /root/.banner_ok
fi

[ Node 2 | node-2 ] echo "test" > /root/custom/scripts/banner.sh
-ash: can't create /root/custom/scripts/banner.sh: nonexistent directory



I'm also noticing other apps fail because /etc doesn't exists yet after 
UBIFS boot loading.
these 2 issues were not seen on 4.14.68.

The bootlog doesn't show any error:
https://pastebin.com/raw/dJx47uBp


I'm only seeing these issues on UBIFS enabled volumes.
Reverting ("ubifs: xattr: Don't operate on deleted inodes") fixes these 
weird issues.


Thanks,

Koen
