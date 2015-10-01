Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhScx-0006c6-I7
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 01:25:44 +0000
Received: by lahh2 with SMTP id h2so65857844lah.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 18:25:21 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: serve_image: use proper POSIX_C_SOURCE value
To: Brian Norris <computersforpeace@gmail.com>
References: <560C7518.4050004@gmail.com> <20151001010428.GA12956@google.com>
Cc: linux-mtd@lists.infradead.org
From: Kirill Smirnov <kirill.k.smirnov@gmail.com>
Message-ID: <560C8B80.5060505@gmail.com>
Date: Thu, 1 Oct 2015 04:25:20 +0300
MIME-Version: 1.0
In-Reply-To: <20151001010428.GA12956@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01.10.2015 04:04, Brian Norris wrote:
> On Thu, Oct 01, 2015 at 02:49:44AM +0300, Kirill Smirnov wrote:
>> struct addrinfo and friends conform to POSIX.1-2001, not earlier.
>> This patch fixes linking against latest glibc 2.22
>
> Please include your 'Signed-off-by', and use inline patches, not
> attachments. For reference, see the Linux patch submission guidelines:
>
> https://www.kernel.org/doc/Documentation/SubmittingPatches
>
I've resent the patch. I'm sorry, while re-formatting mail I forgot to 
remove attachment, so it has been shipped along with the proper inline 
patch. Is it OK?
