Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRdCV-0008JJ-TV
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 08:56:44 +0000
Message-ID: <54F18281.6020502@huawei.com>
Date: Sat, 28 Feb 2015 16:55:29 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Nam Nguyen <namnguyen@google.com>
Subject: Re: Unbounded update to a UBI volume
References: <CA+YNSmVuL+xRd5X0NWj_VCgPBDq9=7mZcqhRaNR1PmRrYL3szg@mail.gmail.com>
In-Reply-To: <CA+YNSmVuL+xRd5X0NWj_VCgPBDq9=7mZcqhRaNR1PmRrYL3szg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/2/27 7:30, Nam Nguyen wrote:
> Hello list,
> 
> The argument to IOCVOLUP is the size of the update.  In case of an
> update from a stream, such as from a BZip'ed source, this size is
> often not known ahead of time.  Is there a way to programmatically
> clear the update marker, without having to pad the volume up to its
> size, hence saving unnecessary writes?
> 
> Thanks,
> Nam

Hi Nam,

I don't think we need an additional way to clear the update marker.
I'm not sure of your use case, I think UBI is mostly used for UBIFS.
We use *ubiupdatevol* which updating the UBIFS image across IOCVOLUP
ioctl. The argument of ubiupdatevol must be a valid UBIFS image, not
a compressed file.

You can first decompress the file and then update the volume.

And actually we have three ways to change an existing volume. Ordinary
write, leb change and updatevol. If updatevol is not suitable for you,
you could try another two ways, I think.

I think in most cases, we could use all of these three ways to write
to a volume except of the static volume, we can only use updatevol to
update it. Is there any other exception?

Thanks,
Hu
