Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6lyZ-00025e-Hw
 for linux-mtd@lists.infradead.org; Mon, 23 Oct 2017 23:17:45 +0000
Received: by mail-oi0-x233.google.com with SMTP id c202so33830801oih.9
 for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2017 16:17:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0a20663c-99f6-40e5-edc4-bf1f23e9c4a6@sigma-star.at>
References: <20171020192807.25761-1-plroskin@gmail.com>
 <0a20663c-99f6-40e5-edc4-bf1f23e9c4a6@sigma-star.at>
From: Pavel Roskin <plroskin@gmail.com>
Date: Mon, 23 Oct 2017 16:17:21 -0700
Message-ID: <CAN_72e14M9hww_pJGwL95_01fdgUW_5GuStMpQXKSBTP-SH9Fw@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: make failure to list extended attributes
 quiet and non-fatal
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

On Mon, Oct 23, 2017 at 2:58 PM, David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
> Hi,
>
> On 10/20/2017 09:28 PM, Pavel Roskin wrote:
>> mkfs.ubifs treats all errors returned by llistxattr() except ENOENT as
>> fatal. In particular, if the host system doesn't support extended
>> attributes, mkfs.ubifs would fail. It happens even without any flags that
>> would explicitly request extended attribute support.
>>
> Would it also work if we simply extended the check you patched to
> test for ENOTSUP in addition?

Yes, that would work. I checked the OpenEmbedded build with the new
patch, it passes. The error is called EOPNOTSUPP. I can submit the
patch if that's the approach you prefer.

-- 
Regards,
Pavel Roskin
