Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2EUz-0003g5-J3
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 08:03:06 +0000
Message-ID: <55769D97.3010602@nod.at>
Date: Tue, 09 Jun 2015 10:02:31 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1433831809.28854.17.camel@sauron.fi.intel.com>
In-Reply-To: <1433831809.28854.17.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.06.2015 um 08:36 schrieb Artem Bityutskiy:
> On Mon, 2015-06-08 at 18:07 +0800, Dongsheng Yang wrote:
>> Currently, ubifs does not support access time anyway. I understand
>> that there is a overhead to update inode in each access from user.
>>
>> But for the following two reasons, I think we can make it optional
>> to user.
>>
>> (1). More and more flash storage in server are trying to use ubifs,
>> it is not only for a device such as mobile phone any more, we want
>> to use it in more and more generic way. Then we need to compete
>> with some other main filesystems. From this point, access time is
>> necessary to us, at least as a choice to user currently.
>>
>> (2). The default mount option about atime is relatime currently,
>> it's much relaxy compared with strictatime. Then we don't update
>> the inode in any accessing. So the overhead is not too much.
>> It's really acceptable.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>> 	It's a RESEND patch to cc to fsdevel as Artem suggested.
>> I would rename force_atime to enable_atime in next version.
> 
> Why do you need to introduce a custom "force_atime" option if there are
> already standard "atime" and "noatime" mount option? I am fine with
> adding atime support to UBIFS in general, and I'd expect this behavior
> then.

I think the rationale behind force_atime was "I know atime can hurt my NAND and I know what
I'm doing". :-)
Such that possible users think of the consequences.

Thanks,
//richard
