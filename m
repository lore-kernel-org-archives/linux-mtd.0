Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7eQ-00064i-2Q
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 19:13:18 +0000
Message-ID: <4F984CC9.9060701@newsguy.com>
Date: Wed, 25 Apr 2012 12:13:13 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips; mtd_read()
 returns -EUCLEAN
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
 <871unbis55.fsf@free.fr>
In-Reply-To: <871unbis55.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the review Robert.

On 04/25/2012 11:27 AM, Robert Jarzmik wrote:
> 
> I think you should change :
>> - 	while (!ret && (len > 0 || ooblen > 0)) {" will exit because ret is not
> into
>> - 	while (ret >= 0 && (len > 0 || ooblen > 0)) {".
> 
> With that change, please add my:
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>


In my exuberance, I prematurely sent the next version of the whole set.  Artem,
Robert's requested change is in patch 7/7.  If no other problems come to light,
maybe you could consider merging the first 6?  Then I only need to prepare a
corrected version of patch 7.

Thanks,
Mike
