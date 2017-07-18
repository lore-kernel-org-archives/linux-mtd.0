Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXKdb-0002tr-Vs
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 05:02:07 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6I4wt7u131303
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2017 01:01:15 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2brr0gs0jc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2017 01:01:14 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 18 Jul 2017 01:01:12 -0400
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: powernv_flash: Lock around concurrent access to
 OPAL
In-Reply-To: <20170607054355.10590-2-cyrilbur@gmail.com>
References: <20170607054355.10590-1-cyrilbur@gmail.com>
 <20170607054355.10590-2-cyrilbur@gmail.com>
Date: Tue, 18 Jul 2017 15:01:03 +1000
MIME-Version: 1.0
Content-Type: text/plain
Message-Id: <87r2xecp9s.fsf@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cyril Bur <cyrilbur@gmail.com> writes:
> OPAL can only manage one flash access at a time and will return an
> OPAL_BUSY error for each concurrent access to the flash. The simplest
> way to prevent this from happening is with a mutex.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> This is to address https://github.com/open-power/skiboot/issues/80

part of me wants to say "let's only take the lock if we ever get back
OPAL_BUSY" or something like that (have a DT property to say the flash
supports concurrent ops?)

Although the other part of me says "you're overthinking this, get back
to the work you're meant to be doing" :)

-- 
Stewart Smith
OPAL Architect, IBM.
